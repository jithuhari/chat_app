import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../dtos/nms_chat_list/nms_chat_list.dart';
import '../../../models/chat_list/chat_list_model.dart';
import '../../../repository/nms_chat_api_repository.dart';

class AllChatController extends GetxController {

  final _chatListModelData = Rx<ChatListModel?>(null);
  ChatListModel? get chatListModelData => _chatListModelData.value;

  final isDialOpen = ValueNotifier(false);
  
  onDissmissed(){

  }

  // fetchChatList() async {
  //   _isLoading.value = true;
  //   try {
  //     final request =
  //         NMSChatListRequest(senderId: '1');
  //     final response = await NMSChatApiRepository.to.fetchChatList(request: request);
  //     if (response.message == "SUCCESS") {
  //       _categoryListModelData.value = response.data;
  //       debugPrint(
  //           "Categorylist-- length  ${categoryListModelData!.content.length.toString()}");
  //       if (categoryListModelData!.content.isNotEmpty) {
  //         for (int i = 0; i < categoryListModelData!.content.length; i++) {
  //           _categoryListModelDataContent
  //               .add(categoryListModelData!.content[i]);
  //         }
  //       } else {}
  //       _isLoading.value = false;
  //       update();
  //     } else {
  //       _isLoading.value = false;
  //       debugPrint("Error");
  //     }
  //   } catch (e) {
  //     showErrorSnackbar(title: errorText, message: e.toString());
  //     _isLoading.value = false;
  //     debugPrint(e.toString());
  //   }
  // }
}
