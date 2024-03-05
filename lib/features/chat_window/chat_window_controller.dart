import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWindowController extends GetxController {
  final Map<String, dynamic>? arguments = Get.arguments;
  late final String firstName = arguments!['firstName'];
  late final String lastName = arguments!['lastName'];
  late final int receiverId = arguments!['receiverId'];

  final TextEditingController searchController = TextEditingController();

  final _oldMessages = (List<dynamic>.empty()).obs;
  List<dynamic> get oldMessages => _oldMessages;

  final _historicalMessages = (List<dynamic>.empty()).obs;
  List<dynamic> get historicalMessages => _historicalMessages;

  final _messages = (List<String>.empty()).obs;
  List<String> get messages => _messages;

  final _reversedOldMessages = (List<String>.empty()).obs;
  List<String> get reversedOldMessages => _reversedOldMessages;

  final _reversedtimeoldMessages = (List<String>.empty()).obs;
  List<String> get reversedtimeoldMessages => _reversedtimeoldMessages;

  final _reversedtimeHistoricMessages = (List<String>.empty()).obs;
  List<String> get reversedtimeHistoricMessages =>
      _reversedtimeHistoricMessages;

  final _reversedMessages = (List<String>.empty()).obs;
  List<String> get reversedMessages => _reversedMessages;

  final _initialOldMessages = (List<String>.empty()).obs;
  List<String> get initialOldMessages => _initialOldMessages;

  final _timeoldMessages = (List<String>.empty()).obs;
  List<String> get timeoldMessages => _timeoldMessages;

  final _timeHistoricMessages = (List<String>.empty()).obs;
  List<String> get timeHistoricMessages => _timeHistoricMessages;

  final _oldMessageSenderId = (List<int>.empty()).obs;
  List<int> get oldMessageSenderId => _oldMessageSenderId;

  final _reversedOldMessageSenderId = (List<int>.empty()).obs;
  List<int> get reversedOldMessageSenderId => _reversedOldMessageSenderId;

  final _selectedIndexes = (List<int>.empty()).obs;
  List<int> get selectedIndexes => _selectedIndexes;

  final _historicalMessageSenderId = (List<int>.empty()).obs;
  List<int> get historicalMessageSenderId => _historicalMessageSenderId;
  final _reversedHistoricalMessageSenderId = (List<int>.empty()).obs;
  List<int> get reversedHistoricalMessageSenderId =>
      _reversedHistoricalMessageSenderId;

  final _isInitialMessageshow = true.obs;
  bool get isInitialMessageshow => _isInitialMessageshow.value;

  final _searchDisplayValue = false.obs;
  bool get searchDisplayValue => _searchDisplayValue.value;

  final _isForwardActive = false.obs;
  bool get isForwardActive => _isForwardActive.value;

  final _isPinMessageActive = false.obs;
  bool get isPinMessageActive => _isPinMessageActive.value;

  final _isStarMessageActive = false.obs;
  bool get isStarMessageActive => _isStarMessageActive.value;

  final _selectedCount = 0.obs;
  int get selectedCount => _selectedCount.value;

  // FocusNode focusNode = FocusNode();

  TextEditingController msgTextController = TextEditingController();

  final _isSendButton = false.obs;
  bool get isSendButton => _isSendButton.value;
  late IO.Socket socket;

  @override
  void onInit() async {
    super.onInit();
    connect();
    await fetchOldlMessage(88, receiverId);
  }

  void connect() {
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
      print(data);

      for (var message in oldMessages) {
        int messageId = message['sender_id'];
        oldMessageSenderId.add(messageId);
        _reversedOldMessageSenderId.value =
            oldMessageSenderId.reversed.toList();

        initialOldMessages.add(message['message']);
        _reversedOldMessages.value = initialOldMessages.reversed.toList();

        timeoldMessages.add(message['message_created_at']);
        _reversedtimeoldMessages.value = timeoldMessages.reversed.toList();
      }
      update();
      print('------$reversedOldMessageSenderId----------');
      print('------$reversedOldMessages----------');
      print('------$reversedtimeoldMessages----------');
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
    print(messageObj);
    socket.emit("message", messageObj);
    socket.on("historicalMessages", (data) {
      _historicalMessages.value = data['historicalMessages'];

      for (var message in historicalMessages) {
        messages.add(message['message']);
        _reversedMessages.value = messages.reversed.toList();
        int historicalMessageId = message['sender_id'];

        historicalMessageSenderId.add(historicalMessageId);
        _reversedHistoricalMessageSenderId.value =
            historicalMessageSenderId.reversed.toList();

        timeHistoricMessages.add(message['message_created_at']);
        _reversedtimeHistoricMessages.value =
            timeHistoricMessages.reversed.toList();
      }
      update();
      // Now you have all the messages in the `messages` list
      print(messages);
      print('-----$reversedHistoricalMessageSenderId');
    });
  }

  //checkBox
  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      // If index is already selected, remove it from the list
      selectedIndexes.remove(index);
      _selectedCount.value--;
    } else {
      // Otherwise, add it to the list
      selectedIndexes.add(index);
      _selectedCount.value++;
    }
    update();
  }

// Function to convert UTC timestamp to Indian Standard Time (IST) and format based on the condition
  String convertToIndianTime(String utcTimestamp) {
    DateTime utcDateTime = DateTime.parse(utcTimestamp);
    DateTime indianDateTime = utcDateTime.toLocal();

    // Get current Indian Standard Time (IST) date
    DateTime now = DateTime.now().toLocal();

    // Calculate yesterday's date
    DateTime yesterday = now.subtract(const Duration(days: 1));

    // Calculate the date 7 days ago from today
    DateTime lastWeek = now.subtract(const Duration(days: 7));

    // Check if the date is today
    if (indianDateTime.year == now.year &&
        indianDateTime.month == now.month &&
        indianDateTime.day == now.day) {
      String timeFormat = DateFormat('h:mm a')
          .format(indianDateTime); // Display time in AM/PM format
      return timeFormat;
    }

    // Check if the date is yesterday
    if (indianDateTime.year == yesterday.year &&
        indianDateTime.month == yesterday.month &&
        indianDateTime.day == yesterday.day) {
      return 'Yesterday';
    }

    // Check if the date is before yesterday but within the last week
    if (indianDateTime.isAfter(lastWeek) &&
        indianDateTime.isBefore(yesterday)) {
      // Return corresponding day of the week
      return DateFormat('EEEE').format(indianDateTime);
    }

    // For any other date, display the date in the format dd/MM/yyyy
    return DateFormat('dd/MM/yyyy').format(indianDateTime);
  }

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

  searchDisplay() {
    _searchDisplayValue.value = !_searchDisplayValue.value;
    update();
  }

  forwardActionActive() {
    _isForwardActive.value = !_isForwardActive.value;
    update();
  }

  clearSelectedCOunt() {
    _selectedCount.value = 0;
    update();
  }

  pinMessageActive() {
    _isPinMessageActive.value = !_isPinMessageActive.value;
    update();
  }

  starMessageActive() {
    _isStarMessageActive.value = !_isStarMessageActive.value;
    update();
  }
}
