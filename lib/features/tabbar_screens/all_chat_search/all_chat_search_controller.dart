import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../dtos/nms_chat_list/nms_chat_list.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/chat_list/chat_list_model.dart';
import '../../../repository/nms_chat_api_repository.dart';

class AllChatSearchController extends GetxController with SnackbarMixin {
  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;

  final _chatListModelData = (List<ChatData>.empty()).obs;
  List<ChatData> get chatListModelData => _chatListModelData;

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
      final request = NMSChatListRequest(senderId: '1', page: '1', size: '10');
      final response =
          await NMSChatApiRepository.to.fetchChatList(request: request);
      if (response.status == 200) {
        _chatListModelData.value = response.data;
        debugPrint("Categorylist-- length  ${_chatListModelData[0].firstName}");
        if (_chatListModelData.isNotEmpty) {
          for (int i = 0; i < chatListModelData.length; i++) {
            DateTime lastMessageDateTime =
                DateTime.parse(chatListModelData[i].lastMessageTime.toString());

            lastMessageDateTime = lastMessageDateTime.add(
              const Duration(hours: 5, minutes: 30),
            );

            _formattedLastMessageTime
                .add(DateFormat('HH:mm').format(lastMessageDateTime));

            debugPrint('-----time------$formattedLastMessageTime');
          }
        } else {}
        _isLoading.value = false;
        update();
      }
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      _isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
