import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWindowController extends GetxController {
  TextEditingController msgTextController = TextEditingController();
  final _historicmessageData = "".obs;
  String get historicmessageData => _historicmessageData.value;
  final _isSendButton = false.obs;
  bool get isSendButton => _isSendButton.value;
  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();

    connect();
  }

  void connect()
  // (Map<String, dynamic> messageObj)
  {
    socket = IO.io('http://103.12.1.151:4321', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    // socket.emit("message", 'haiii how are u');
    socket.onConnect((data) => debugPrint("Connected"));
    debugPrint(socket.connected.toString());
  }

  void sendMessage(String msg, int senderId, int receiverId, int page) {
    Map<String, dynamic> messageObj = {
      "message": msg,
      "user": senderId,
      "sender_id": senderId,
      "receiver_id": receiverId,
      "page": page,
    };
    socket.emit("message", messageObj);
    socket.on("historicalMessages", (data) {
      //  debugPrint('Received message: $data');
      _historicmessageData.value = data.toString();
      print('-----------Received message:$historicmessageData---------------------');
    });
  }

  changeSendButtonStatusToTrue() {
    _isSendButton.value = true;
    update();
  }

  changeSendButtonStatusTofalse() {
    _isSendButton.value = false;
    update();
  }
}
