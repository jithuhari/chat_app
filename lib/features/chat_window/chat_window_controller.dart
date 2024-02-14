import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWindowController extends GetxController {
  final Map<String, dynamic> arguments = Get.arguments;
  late final String firstName = arguments['firstName'];
  late final String lastName = arguments['lastName'];
  late final int receiverId = arguments['receiverId'];

  final _oldMessages = (List<dynamic>.empty()).obs;
  List<dynamic> get oldMessages => _oldMessages;

  final _historicalMessages = (List<dynamic>.empty()).obs;
  List<dynamic> get historicalMessages => _historicalMessages;

  final _messages = (List<String>.empty()).obs;
  List<String> get messages => _messages;

  final _initialOldMessages = (List<String>.empty()).obs;
  List<String> get initialOldMessages => _initialOldMessages;

  final _isInitialMessageshow = true.obs;
  bool get isInitialMessageshow => _isInitialMessageshow.value;

  FocusNode focusNode = FocusNode();

  TextEditingController msgTextController = TextEditingController();
  // final _historicmessageData = "".obs;
  // String get historicmessageData => _historicmessageData.value;
  final _isSendButton = false.obs;
  bool get isSendButton => _isSendButton.value;
  late IO.Socket socket;

  @override
  void onInit() async {
    super.onInit();
    connect();
    await fetchOldlMessage(1, receiverId);
    // await fetchHistoricalMessage();
  }

  void connect()
  // (Map<String, dynamic> messageObj)
  {
    socket = IO.io('http://103.12.1.151:4321', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) => debugPrint("Connected"));
    debugPrint(socket.connected.toString());
  }

  fetchOldlMessage(int senderId, int receiverId) {
    Map<String, dynamic> messageObj = {
      "sender_id": senderId,
      "receiver_id": receiverId,
    };
    socket.emit("old_message", messageObj);

    socket.on("oldMessages", (data) {
      _oldMessages.value = data['oldMessages'];

      for (var message in oldMessages) {
        // _initialOldMessages.value = message['message'];
        initialOldMessages.add(message['message']);
      }
      update();

      print('------$initialOldMessages----------');
    });
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
      _historicalMessages.value = data['historicalMessages'];
      // List<String> messages = [];

      for (var message in historicalMessages) {
        messages.add(message['message']);
      }
      update();
      // Now you have all the messages in the `messages` list
      print(messages);

      //  debugPrint('Received message: ${data['historicalMessages']}');
      // _historicmessageData.value = data.toString();
      // print(
      //     '-----------Received message:$historicmessageData---------------------');
    });
  }

//   void fetchMessages(Map<String, dynamic> data) {
//   List<dynamic> historicalMessages = data['historicalMessages'];
//   List<String> messages = [];

//   for (var message in historicalMessages) {
//     messages.add(message['message']);
//   }

//   // Now you have all the messages in the `messages` list
//   print(messages);
// }

  changeSendButtonStatusToTrue() {
    _isSendButton.value = true;
    update();
  }

  changeSendButtonStatusTofalse() {
    _isSendButton.value = false;
    update();
  }

  isInitialMessageshowfalse() {
    _isInitialMessageshow.value = false;
    update();
  }
}
