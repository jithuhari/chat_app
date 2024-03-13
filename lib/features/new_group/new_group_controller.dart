import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../dtos/chat_app_dtos/create_group/create_group.dart';
import '../../dtos/chat_app_dtos/group_user_list/group_user_list.dart';
import '../../models/create_group/create_group_model.dart';
import '../../models/new_chat/new_chat_model.dart';
import '../../repository/nms_chat_api_repository.dart';

class NewGroupController extends GetxController with SnackbarMixin {

  final TextEditingController groupNameController = TextEditingController();

  final _firstName = (List<dynamic>.empty()).obs;
  List<dynamic> get firstName => _firstName;

  final _lastName = (List<dynamic>.empty()).obs;
  List<dynamic> get lastName => _lastName;

  final _createGroupData = Rx<CreateGroupModelData?>(null);
  CreateGroupModelData? get createGroupData =>
      _createGroupData.value;

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
            lastName.add(nmsGroupUserListDetails[i].lastName);

            debugPrint('-----name------$firstName');
          }
          update();
        } else {}
      }
      update();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      debugPrint(e.toString());
    }
  }


  //create group api
  createGroup() async {
    // _isLoading.value = true;
    try {
      final request = CreateGroupRequest(
        groupName: groupNameController.value.text,
        createdBy: 88,
        groupMembers: [88,89,90]
        
      );
      final response =
          await NMSChatApiRepository.to.createGroup(request: request);
      if (response.status == 200) {
        _createGroupData.value = response.data;

        debugPrint(
            "Categorylist-- length  ${_createGroupData.value!.groupId}");

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
