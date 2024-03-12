import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../dtos/chat_app_dtos/group_user_list/group_user_list.dart';
import '../../models/new_chat/new_chat_model.dart';
import '../../repository/nms_chat_api_repository.dart';

class NewGroupController extends GetxController with SnackbarMixin {
  final _firstName = (List<dynamic>.empty()).obs;
  List<dynamic> get firstName => _firstName;

  @override
  void onInit() async {
    await fetchNMSGroupUserList();
    super.onInit();
  }

  final _nmsGroupUserListDetails = (List<UsersListModelDatum>.empty()).obs;
  List<UsersListModelDatum> get nmsGroupUserListDetails =>
      _nmsGroupUserListDetails;

  fetchNMSGroupUserList() async {
    // _isLoading.value = true;
    try {
      final request = NMSGroupUserListRequest(
        senderId: '88',
        field: 'firstname',
        sortOrder: 'ASC',
        page: 0,
        size: 10,
        workEmail: 'workEmail',
        workLocation: 'workLocation',
        workMobileNumber: 'workMobileNumber',
      );
      final response =
          await NMSChatApiRepository.to.fetchNMSGroupUserList(request: request);
      if (response.status == 200) {
        _nmsGroupUserListDetails.value = response.data;

        if (_nmsGroupUserListDetails.isNotEmpty) {
          for (int i = 0; i < _nmsGroupUserListDetails.length; i++) {
            // _newChatUserListLength.value = _newChatListModelData.length;

            firstName.add(nmsGroupUserListDetails[i].firstName);

            debugPrint('-----name------$firstName');
          }
          update();
        } else {}

        // debugPrint(
        //     "Name  ${_nmsGroupUserListDetails[1].firstName}");

        // _email.value = _profileDetailsModelData.value!.email;
        // _firstName.value = _profileDetailsModelData.value!.firstName;
        // _lastName.value = _profileDetailsModelData.value!.lastName;
        // _phNumber.value = _profileDetailsModelData.value!.phone;
        // if (_chatListModelData.isNotEmpty) {
        //   for (int i = 0; i < chatListModelData.length; i++) {
        //     // _chatUserListLength.value = _chatListModelData.length;
        //   }
        // }
      }
      update();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
