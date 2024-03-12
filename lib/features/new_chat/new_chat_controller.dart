import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dtos/chat_app_dtos/new_chat/nms_new_chat.dart';
import '../../mixins/snackbar_mixin.dart';
import '../../models/new_chat/new_chat_model.dart';
import '../../repository/nms_chat_api_repository.dart';

class NewChatSearchController extends GetxController with SnackbarMixin {
  @override
  void onInit() async {
    // print('init on');
    await fetchNewChatList();
    super.onInit();
  }

  final _newChatListModelData = (List<UsersListModelDatum>.empty()).obs;
  List<UsersListModelDatum> get newChatListModelData => _newChatListModelData;

  final _newChatUserListLength = 1000.obs;
  int get newChatUserListLength => _newChatUserListLength.value;

  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  fetchNewChatList() async {
    _isLoading.value = true;
    try {
      final request = NMSNewChatListRequest(
          senderId: '88',
          page: 0,
          size: 10,
          field: 'firstname',
          sortOrder: 'ASC',
          workEmail: 'workEmail',
          workLocation: 'workLocation',
          workMobileNumber: 'workMobileNumber');
      final response =
          await NMSChatApiRepository.to.fetchNewChatList(request: request);
      if (response.status == 200) {
        _newChatListModelData.value = response.data;

        debugPrint("Categorylist-- length  ${_newChatListModelData.length}");
        if (_newChatListModelData.isNotEmpty) {
          for (int i = 0; i < newChatListModelData.length; i++) {
            _newChatUserListLength.value = _newChatListModelData.length;

            debugPrint('-----name------${_newChatListModelData[i].firstName}');
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
