import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/storage.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
  FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // 1. Request permission (iOS + Android 13+)
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    log('Notification permission status: ${settings.authorizationStatus}');

    // If permission wasn't granted, no point continuing further
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log('User declined notification permission');
      return;
    }

    // 2. iOS: let foreground notifications show banner/sound/badge
    if (Platform.isIOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    // 3. Setup local notifications channel (Android needs this to show foreground notifications)
    if (Platform.isAndroid) {
      const androidChannel = AndroidNotificationChannel(
        'chat_messages',
        'Chat Messages',
        importance: Importance.high,

      );
      await _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);
    }

    final initSettings = InitializationSettings(
      android: Platform.isAndroid
          ? const AndroidInitializationSettings('@mipmap/ic_launcher')
          : null,
      iOS: Platform.isIOS
          ? const DarwinInitializationSettings(
        requestAlertPermission: false, // already requested via FCM above
        requestBadgePermission: false,
        requestSoundPermission: false,
      ) : null,
    );

    final localNotificationDetails =
    await _localNotifications.getNotificationAppLaunchDetails();
    if (localNotificationDetails?.didNotificationLaunchApp ?? false) {
      final payload = localNotificationDetails?.notificationResponse?.payload;
      print("Notification payload:: $payload");
      if (payload != null && payload.isNotEmpty) {
        _routeToChat(payload);
      }
    }

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // 4. Get and register token
    final token = await _getToken();
    if (token != null) await _sendTokenToBackend(token);
    _fcm.onTokenRefresh.listen(_sendTokenToBackend);

    // 5. Foreground messages — show manually since FCM won't auto-display these
    FirebaseMessaging.onMessage.listen(_showLocalNotification);

    // 6. Handle tap when app opened from background via notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationNavigation);

    // 7. Handle app opened from terminated state via notification
    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationNavigation(initialMessage);
    }
  }

  void _routeToChat(String chatId) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int attempts = 0;
      // Wait until GetX context / navigator key is fully attached to widget tree
      while (Get.key.currentState == null && attempts < 30) {
        await Future.delayed(const Duration(milliseconds: 100));
        attempts++;
      }

      log("Cold-start / background navigating to conversation: $chatId");
      Get.toNamed(
        AppRoutes.sellersChatSpace,
        arguments: {"conversationId": chatId},
      );
    });
  }

  /// iOS requires the APNS token to be set before FCM's getToken() will work.
  /// This waits (with a timeout) for that to happen before requesting the token.
  Future<String?> _getToken() async {
    if (Platform.isIOS) {
      String? apnsToken = await _fcm.getAPNSToken();
      int attempts = 0;
      while (apnsToken == null && attempts < 10) {
        await Future.delayed(const Duration(seconds: 1));
        apnsToken = await _fcm.getAPNSToken();
        attempts++;
      }

      if (apnsToken == null) {
        log('APNS token not available after waiting — skipping FCM token fetch');
        return null;
      }
    }

    return _fcm.getToken();
  }

  void _showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;
    print("Notification received: ${notification.title} - ${notification.body} - ${message.data}");
    _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: Platform.isAndroid
            ? const AndroidNotificationDetails(
          'chat_messages',
          'Chat Messages',
          importance: Importance.high,
          priority: Priority.high,
        )
            : null,
        iOS: Platform.isIOS ? const DarwinNotificationDetails() : null,
      ),
      payload: message.data['conversationId'],
    );
  }

  void _onNotificationTap(NotificationResponse response) {
    final chatId = response.payload;
    print("Notification tapped: ${response.data} - Payload: $chatId");
    if (chatId != null) {
      Get.toNamed(AppRoutes.sellersChatSpace,
          arguments: {"conversationId": chatId});
    }
  }

  void _handleNotificationNavigation(RemoteMessage message) {

    print("Notification Navigation: ${message.data}");
    final chatId = message.data['conversationId'];
    if (chatId != null) {
      Get.toNamed(AppRoutes.sellersChatSpace,
          arguments: {"conversationId": chatId});
    }
  }

  Future<void> _sendTokenToBackend(String token) async {
    await ApiClient.to.sendNotificationToken(
      data: jsonEncode({
        "userId": UserStore.to.profile.id,
        'fcmToken': token,
        "platform": Platform.isAndroid ? "ANDROID" : "IOS",
      }),
      onSuccess: (res) {
        UserStore.to.setFcmToken(token);
        log("Successfully sent FCM token to backend: $res");
      },
      onError: (res) {
        log("Error sending FCM token to backend: $res");
      },
    );
  }

  Future<void> unregisterFcmToken() async {
    await ApiClient.to.unregisterFcmToken(
      data: jsonEncode({
        'fcmToken': UserStore.to.getFcmToken()
      }),
      onSuccess: (res) {
        UserStore.to.setFcmToken("");
        log("Successfully unregistered FCM token to backend: $res");
      },
      onError: (res) {
        log("Error unregistering FCM token to backend: $res");
      },
    );
  }
}