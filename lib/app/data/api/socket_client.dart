import 'package:cars_and_alll/app/services/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

/// A listener handle returned by the `onXxx` methods below. Pass the exact
/// same instance back into the matching `offXxx` method to remove only that
/// listener — plain `socket.off(event)` would wipe out every listener for
/// that event, including ones registered by other controllers.
typedef SocketListener = void Function(dynamic data);

class SocketService {
  SocketService._internal();
  static final SocketService instance = SocketService._internal();

  static const String apiLink = 'https://carsandallapi.onrender.com';

  io.Socket? _socket;

  /// Lazily creates the socket the first time it's needed, instead of
  /// requiring every call site to remember to `await init()` first and win
  /// the race against it. Safe to call repeatedly — a no-op once `_socket`
  /// exists.
  ///
  /// (UserStore.to.getToken() reads synchronously from GetStorage, so
  /// there's nothing here that actually needs to be async.)
  io.Socket get socket {
    _socket ??= io.io(
      apiLink,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect() // autoConnect: false
          .setAuth({'token': UserStore.to.getToken()})
          .build(),
    );
    return _socket!;
  }

  bool get isConnected => _socket?.connected ?? false;

  /// Optional explicit call at app startup — kept for readability at call
  /// sites (e.g. `main.dart`) and API compatibility, but no longer load-
  /// bearing: the `socket` getter above self-initializes regardless.
  void init() {
    // ignore: unnecessary_statements
    socket; // touch the getter to force creation
  }

  /// Refresh the auth token (e.g. after login) before connecting.
  Future<void> updateToken(String token) async {
    await UserStore.to.setToken(token);
    _socket?.auth = {'token': token};
  }

  void connect() {
    if (!isConnected) socket.connect();
  }

  void disconnect() {
    _socket?.disconnect();
  }

  void joinConversation(String conversationId) {
    socket.emit('joinConversation', {'conversationId': conversationId});
  }

  void leaveConversation(String conversationId) {
    socket.emit('leaveConversation', {'conversationId': conversationId});
  }

  // ---------------- newMessage ----------------

  SocketListener onNewMessage(void Function(Map<String, dynamic> data) handler) {
    void listener(dynamic data) => handler(Map<String, dynamic>.from(data));
    socket.on('newMessage', listener);
    return listener;
  }

  void offNewMessage([SocketListener? listener]) =>
      socket.off('newMessage', listener);

  // ---------------- conversationUpdated ----------------

  SocketListener onConversationUpdated(
      void Function(Map<String, dynamic> data) handler) {
    void listener(dynamic data) => handler(Map<String, dynamic>.from(data));
    socket.on('conversationUpdated', listener);
    return listener;
  }

  void offConversationUpdated([SocketListener? listener]) =>
      socket.off('conversationUpdated', listener);

  // ---------------- conversationSeen ----------------

  SocketListener onConversationSeen(
      void Function(Map<String, dynamic> data) handler) {
    void listener(dynamic data) => handler(Map<String, dynamic>.from(data));
    socket.on('conversationSeen', listener);
    return listener;
  }

  void offConversationSeen([SocketListener? listener]) =>
      socket.off('conversationSeen', listener);
}