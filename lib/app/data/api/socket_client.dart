import 'dart:async';

import 'package:cars_and_alll/app/services/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

typedef SocketListener = void Function(dynamic data);

class SocketService {
  SocketService._internal();
  static final SocketService instance = SocketService._internal();

  static const String apiLink = 'https://carsandallapi.onrender.com';

  io.Socket? _socket;
  Timer? _reconnectTimer;

  static const Duration _reconnectInterval = Duration(seconds: 30);

  io.Socket get socket {
    _socket ??= io.io(
        apiLink,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setAuth({
          'token': UserStore.to.getToken(),
        }).build());

        _setupSocketListeners();

    return _socket!;
  }

  bool get isConnected => _socket?.connected ?? false;

  void init() {
    socket;
    _startReconnectWatcher();
  }

  void _setupSocketListeners() {
    // Prevent registering these multiple times.
    if (_socket == null) return;

    _socket!.onConnect((_) {
      print('Socket connected');
    });

    _socket!.onDisconnect((reason) {
      print('Socket disconnected: $reason');
    });

    _socket!.onConnectError((error) {
      print('Socket connection error: $error');
    });
  }

  void _startReconnectWatcher() {
    _reconnectTimer?.cancel();

    _reconnectTimer = Timer.periodic(
      _reconnectInterval,
          (_) {
        _checkAndReconnect();
      },
    );
  }

  void _checkAndReconnect() {
    if (!isConnected) {
      print('Socket disconnected. Attempting reconnect...');
      connect();
    }
  }

  void connect() {
    if (_socket == null) {
      socket;
    }

    if (!isConnected) {
      socket.connect();
    }
  }

  void disconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _socket?.disconnect();
  }

  void joinConversation(String conversationId) {
    socket.emit(
      'joinConversation',
      {
        'conversationId': conversationId,
      },
    );
  }

  void leaveConversation(String conversationId) {
    socket.emit(
      'leaveConversation',
      {
        'conversationId': conversationId,
      },
    );
  }

  // ---------------- newMessage ----------------

  SocketListener onNewMessage(
      void Function(Map<String, dynamic> data) handler,
      ) {
    void listener(dynamic data) {
      handler(Map<String, dynamic>.from(data));
    }

    socket.on('newMessage', listener);
    return listener;
  }

  void offNewMessage([SocketListener? listener]) {
    socket.off('newMessage', listener);
  }

  // ---------------- conversationUpdated ----------------

  SocketListener onConversationUpdated(
      void Function(Map<String, dynamic> data) handler,
      ) {
    void listener(dynamic data) {
      handler(Map<String, dynamic>.from(data));
    }

    socket.on('conversationUpdated', listener);
    return listener;
  }

  void offConversationUpdated([SocketListener? listener]) {
    socket.off('conversationUpdated', listener);
  }

  // ---------------- conversationSeen ----------------

  SocketListener onConversationSeen(
      void Function(Map<String, dynamic> data) handler,
      ) {
    void listener(
        dynamic data,
        ) {
      handler(Map<String, dynamic>.from(data));
    }

    socket.on('conversationSeen', listener);
    return listener;
  }

  void offConversationSeen([SocketListener? listener]) {
    socket.off('conversationSeen', listener);
  }

  void dispose() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _socket?.dispose();
    _socket = null;
  }
}
