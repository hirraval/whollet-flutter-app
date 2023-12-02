import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

typedef VoidCallback = void Function();

class WebSocket {
  final String _url;
  Map<String, dynamic> queryParams;
  Socket? _socket;
  VoidCallback? onConnected, onDisconnect;

  WebSocket(this._url, [this.queryParams = const {}]);

  bool get isConnected => _socket?.connected ?? false;

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

  Future<void> connect([query = const {}]) async {
    try {
      queryParams = query;
      var options = OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders({'Connection': 'upgrade', 'Upgrade': 'websocket'})
      // .setAuth(queryParams)
          .enableAutoConnect()
          .disableAutoConnect()
          .enableForceNew()
          .enableForceNewConnection()
          .setQuery(queryParams)
          .setTimeout(60000)
          .build();

      _socket = io(_url, options);

      _socket?.onConnectError((data) {
        debugPrint("WebSocket.onConnectError: $data");
      });
      _socket?.onConnect((data) {
        onConnected?.call();
        debugPrint("WebSocket.onConnect: ${_socket?.id} ${_socket?.connected}");
      });
      /*_socket?.onReconnect((data) {
        onConnected?.call();
        debugPrint("WebSocket.onReconnect: ${_socket?.id} ${_socket?.connected}");
      });*/
      _socket?.onDisconnect((data) {
        onDisconnect?.call();
        debugPrint("WebSocket.onDisconnect: $data");
      });
      _socket?.connect();
      debugPrint("WebSocket Connecting... $_url ${_socket?.opts}");
    } catch (error) {
      debugPrint("WebSocket.connect -> $error");
    }
  }

  void emit(event, [data]) {
    _socket?.emit(event, data);
    debugPrint("WebSocket Send :: $event -> $data");
  }

  Future<void> emitWithAck(event, {data, Function(dynamic data)? handler}) {
    final Completer completer = Completer();
    _socket?.emitWithAck(event, data, ack: (data){
      handler?.call(data);
      completer.complete();
    });
    debugPrint("WebSocket Send :: $event -> $data");
    return completer.future;
  }

  void on(String event, void Function(dynamic data) handler) {
    debugPrint("WebSocket listening on : $event");
    _socket?.on(event, (data) {
      debugPrint("WebSocket on : $event -> $data");
      handler.call(data);
    });
  }

  void off(String event) {
    debugPrint("WebSocket off : $event");
    _socket?.off(event);
  }

  void close() {
    _socket?.disconnect();
  }

  void join(List<String> rooms) {
    _socket?.emit("join", {"rooms": rooms});
  }
}
