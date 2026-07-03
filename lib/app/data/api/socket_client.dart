import 'package:cars_and_alll/app/services/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:shared_preferences/shared_preferences.dart';

class SocketService {
  SocketService._internal();
  static final SocketService instance = SocketService._internal();

  static const String apiLink = 'https://carsandallapi.onrender.com';
  static const String tokenKey = '_carsandall_client_access_token';

  io.Socket? _socket;
  io.Socket get socket {
    assert(_socket != null, 'Call SocketService.instance.init() first');
    return _socket!;
  }

  bool get isConnected => _socket?.connected ?? false;

  /// Call once at app startup (e.g. in main() or a top-level provider),
  /// mirroring the module-level `const socket = io(...)` in JS.
  Future<void> init() async {
    if (_socket != null) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey);

    _socket = io.io(
      apiLink,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect() // autoConnect: false
          .setAuth({'token': UserStore.to.getToken()})
          .build(),
    );
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

  void onNewMessage(void Function(Map<String, dynamic> data) handler) {
    socket.on('newMessage', (data) => handler(Map<String, dynamic>.from(data)));
  }

  void offNewMessage() => socket.off('newMessage');

  void onConversationUpdated(
      void Function(Map<String, dynamic> data) handler) {
    socket.on(
        'conversationUpdated', (data) => handler(Map<String, dynamic>.from(data)));
  }

  void offConversationUpdated() => socket.off('conversationUpdated');

  void onConversationSeen(void Function(Map<String, dynamic> data) handler) {
    socket.on(
        'conversationSeen', (data) => handler(Map<String, dynamic>.from(data)));
  }

  void offConversationSeen() => socket.off('conversationSeen');
}
