import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../dtos/chat_app_dtos/new_chat/nms_new_chat.dart';
import '../../mixins/snackbar_mixin.dart';
import '../../models/new_chat/new_chat_model.dart';
import '../../repository/nms_chat_api_repository.dart';

class NewChatSearchController extends GetxController with SnackbarMixin {
  @override
  void onInit() async {
    // print('init on');
    // await fetchNewChatList();
    super.onInit();
  }

  // final _newChatListModelData = (List<NewChatDatum>.empty()).obs;
  // List<NewChatDatum> get newChatListModelData => _newChatListModelData;

  final _newChatUserListLength = 1000.obs;
  int get newChatUserListLength => _newChatUserListLength.value;

  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  // fetchNewChatList() async {
  //   _isLoading.value = true;
  //   try {
  //     final request = NMSNewChatListRequest(
  //         senderId: '8',
  //         page: 1,
  //         size: 10,
  //         field: 'firstname',
  //         sortOrder: 'ASC',
  //         workEmail: 'workEmail',
  //         workLocation: 'workLocation',
  //         workMobileNumber: 'workMobileNumber');
  //     final response =
  //         await NMSChatApiRepository.to.fetchNewChatList(request: request);
  //     if (response.status == 200) {
  //       _newChatListModelData.value = response.data;

  //       debugPrint("Categorylist-- length  ${_newChatListModelData.length}");
  //       if (_newChatListModelData.isNotEmpty) {
  //         for (int i = 0; i < newChatListModelData.length; i++) {
  //           _newChatUserListLength.value = _newChatListModelData.length;

  //           // Parse lastMessageTime string to DateTime
  //           DateTime lastMessageDateTime = DateTime.parse(
  //               newChatListModelData[i].lastMessageTime.toString());

  //           // Add 5 hours and 30 minutes
  //           lastMessageDateTime = lastMessageDateTime.add(
  //             const Duration(hours: 5, minutes: 30),
  //           );

  //           // Get today's date
  //           DateTime now = DateTime.now();
  //           DateTime today = DateTime(now.year, now.month, now.day);

  //           // Calculate the date a week ago
  //           DateTime oneWeekAgo = today.subtract(const Duration(days: 7));

  //           // Format DateTime to a string with the desired format
  //           String formattedDate =
  //               DateFormat('dd/MM/yyyy').format(lastMessageDateTime);
  //           String formattedTime =
  //               DateFormat('HH:mm').format(lastMessageDateTime);

  //           // Check if the message was sent today
  //           if (lastMessageDateTime.isAfter(today)) {
  //             // String formattedDay = 'Today';
  //             // _formattedLastMessageTime.add(formattedDay);
  //             _formattedLastMessageTime.add(formattedTime);
  //           } else {
  //             // Check if the message was sent yesterday
  //             DateTime yesterday = today.subtract(const Duration(days: 1));
  //             if (lastMessageDateTime.isAfter(yesterday)) {
  //               String formattedDay = 'Yesterday';
  //               _formattedLastMessageTime.add(formattedDay);
  //             } else {
  //               // Check if the message was sent before a week
  //               if (lastMessageDateTime.isAfter(oneWeekAgo)) {
  //                 // If yes, show the date

  //                 String formattedDay =
  //                     DateFormat('EEEE').format(lastMessageDateTime);
  //                 _formattedLastMessageTime.add(formattedDay);
  //               } else {
  //                 // If not today, yesterday, or before a week, add the formatted time
  //                 _formattedLastMessageTime.add(formattedDate);
  //               }
  //             }
  //           }

  //           debugPrint('-----time/day------${_formattedLastMessageTime[i]}');
  //         }
  //       } else {}
  //       _isLoading.value = false;
  //       update();
  //     }
  //   } catch (e) {
  //     showErrorSnackbar(message: e.toString());
  //     _isLoading.value = false;
  //     debugPrint(e.toString());
  //   }
  // }
}
