import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../dtos/chat_app_dtos/create_group/create_group.dart';
import '../../dtos/chat_app_dtos/create_new_user/create_new_user.dart';
import '../../dtos/chat_app_dtos/group_user_list/group_user_list.dart';
import '../../models/create_group/create_group_model.dart';
import '../../models/create_new_user/create_new_user_model.dart';
import '../../models/new_chat/new_chat_model.dart';
import '../../repository/nms_chat_api_repository.dart';

class NewGroupController extends GetxController with SnackbarMixin {
  final TextEditingController groupNameController = TextEditingController();

  final _selectedIndexes = (List<int>.empty()).obs;
  List<int> get selectedIndexes => _selectedIndexes;

  final _firstName = (List<dynamic>.empty()).obs;
  List<dynamic> get firstName => _firstName;

  final _lastName = (List<dynamic>.empty()).obs;
  List<dynamic> get lastName => _lastName;

  final _myUserId = (List<dynamic>.empty()).obs;
  List<dynamic> get myUserId => _myUserId;

  final _myUserUniqueId = (List<dynamic>.empty()).obs;
  List<dynamic> get myUserUniqueId => _myUserUniqueId;

  final _nmsGroupUserListDetails = (List<UsersListModelDatum>.empty()).obs;
  List<UsersListModelDatum> get nmsGroupUserListDetails =>
      _nmsGroupUserListDetails;

  final _createGroupData = Rx<CreateGroupModelData?>(null);
  CreateGroupModelData? get createGroupData => _createGroupData.value;

  final _createNewUserModelData = Rx<CreateNewUserModelData?>(null);
  CreateNewUserModelData? get createNewUserModelData =>
      _createNewUserModelData.value;

  @override
  void onInit() async {
    await fetchNMSGroupUserList();
    super.onInit();
  }

  fetchNMSGroupUserList() async {
    // _isLoading.value = true;
    try {
      final request = NMSGroupUserListRequest(
        senderId: '88',
        field: 'firstname',
        sortOrder: 'ASC',
        page: 0,
        size: 100,
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
            // myUserId.add(nmsGroupUserListDetails[i].id);

            debugPrint('-----name------$firstName');
            // debugPrint('-----id------$myUserId');
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
          groupMembers: myUserId);
      final response =
          await NMSChatApiRepository.to.createGroup(request: request);
      if (response.status == 200) {
        _createGroupData.value = response.data;

        debugPrint("Categorylist-- length  ${_createGroupData.value!.groupId}");
      }
      update();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  //create user api

  createUser(String email, String firstName, String lastName, String orgId,
      String phone, int status, String userName, String userUniqueId) async {
    // _isLoading.value = true;
    try {
      final request = CreateNewUserRequest(
        email: email,
        firstName: firstName,
        lastName: lastName,
        orgId: orgId,
        phone: phone,
        status: status,
        userName: userName,
        userUniqueId: userUniqueId,
      );
      final response =
          await NMSChatApiRepository.to.createUser(request: request);
      if (response.status == 200) {
        _createNewUserModelData.value = response.data;

        debugPrint(
            "Categorylist-- length  ${_createNewUserModelData.value!.id}");
      }
      update();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  //checkBox
  void toggleSelection(int index) async {
    if (selectedIndexes.contains(index)) {
      // If index is already selected, remove it from the list
      selectedIndexes.remove(index);
      // Remove corresponding myUserId
      int userIdIndex = myUserId.indexOf(nmsGroupUserListDetails[index].id);
      int userUniqueIdIndex =
          myUserUniqueId.indexOf(nmsGroupUserListDetails[index].userId);

      if (userIdIndex != -1 && userUniqueIdIndex != -1) {
        myUserId.removeAt(userIdIndex);
        myUserUniqueId.removeAt(userUniqueIdIndex);
      }
      debugPrint('-----id------$myUserUniqueId');
    } else {
      // Otherwise, add it to the list
      selectedIndexes.add(index);
      // Add corresponding myUserId
      myUserId.add(nmsGroupUserListDetails[index].id);
      myUserUniqueId.add(nmsGroupUserListDetails[index].userId);
      debugPrint('-----id------$myUserId');

      if (nmsGroupUserListDetails[index].id == null) {
        await createUser('ada@wqderssasass', 'assass', 'aadsssdd', 'nintriva',
            '123448', 1, 'aa_133s1', myUserUniqueId.last);
      }
    }
    update();
  }
}
