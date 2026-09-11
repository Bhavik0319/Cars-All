import 'package:cars_and_alll/shared/theme/theme_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'app/controller/home_nav_controller.dart';
import 'app/data/api/api_client.dart';
import 'app/routes/app_router.dart';
import 'app/routes/app_routes.dart';
import 'app/services/auth_services.dart';
import 'app/services/notification_service.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';
import 'dart:ui' as ui;

import 'app/data/dl_container.dart' as di;

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  ThemeHelper().changeTheme('primary');
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ApiClient>(ApiClient());
  Get.put<UserStore>(UserStore());
  Get.put(BottomNavController());
  Get.put<AuthServices>(AuthServices());
  // await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('hi'),
        Locale('gu'),
        Locale('te'),
        Locale('ta'),
        Locale('bn'),
        Locale('as'),
        Locale('kn'),
        Locale('ml'),
        Locale('mr'),
        Locale('ur'),
      ],
      path: 'assets/language',
      fallbackLocale: Locale('en'),
      // Pass initial chat id (if app was launched from a notification)
      child: ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    if(UserStore.to.getFcmToken() != null || UserStore.to.getFcmToken() != "") {
      NotificationService().initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Builder(
      builder: (context) {
        return GetMaterialApp(
          key: ValueKey(context.locale.toString()),
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.router,
          initialRoute: AppRoutes.splashScreen,
          theme: theme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQueryData.copyWith(
                textScaler: TextScaler.noScaling
              ),
              child: Directionality(
                textDirection: ui.TextDirection.ltr,
                child: child!,
              ),
            );
          },
        );
      }
    );
  }
}

