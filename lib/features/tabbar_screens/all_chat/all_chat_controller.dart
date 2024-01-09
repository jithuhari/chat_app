import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../dtos/nms_chat_list/nms_chat_list.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/chat_list/chat_list_model.dart';
import '../../../repository/nms_chat_api_repository.dart';

class AllChatController extends GetxController with SnackbarMixin {
  final _chatListModelData = Rx<ChatListModel?>(null);
  ChatListModel? get chatListModelData => _chatListModelData.value;

  final isDialOpen = ValueNotifier(false);

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    await fetchChatList();

    super.onInit();
  }

  onDissmissed() {}

  fetchChatList() async {
    _isLoading.value = true;
    try {
      final request = NMSChatListRequest(senderId: '1');
      final response =
          await NMSChatApiRepository.to.fetchChatList(request: request);
      if (response.status == 200) {
        if (response.data != null && response.data.isNotEmpty) {
          _chatListModelData.value =
              response.data[0]; // Assuming you want the first item
          debugPrint(
              "Categorylist-- length  ${_chatListModelData.value!.firstName}");
        } else {
          // Handle the case where the response data is empty or null
        }
        // _chatListModelData.value = response.data;
        // debugPrint(
        //     "Categorylist-- length  ${_chatListModelData.value!.firstName}");
        // if (_chatListModelData!.content.isNotEmpty) {
        //   for (int i = 0; i < categoryListModelData!.content.length; i++) {
        //     _categoryListModelDataContent
        //         .add(categoryListModelData!.content[i]);
        //   }
        // } else {}
        _isLoading.value = false;
        update();
        // }
        // else {
        //   _isLoading.value = false;
        //   debugPrint("Error");
      }
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      _isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
