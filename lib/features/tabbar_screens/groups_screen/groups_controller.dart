import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../dtos/chat_app_dtos/list_group/list_group.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/list_group/list_group_model.dart';
import '../../../repository/nms_chat_api_repository.dart';

class AllGroupController extends GetxController with SnackbarMixin {
  final _fetchGroupsDetails = (List<ListGroupModelData>.empty()).obs;
  List<ListGroupModelData> get fetchGroupsDetails => _fetchGroupsDetails;

  @override
  void onInit() async {
    await fetchGroups();
    super.onInit();
  }

  fetchGroups() async {
    // _isLoading.value = true;
    try {
      final request = ListGroupRequest(page: '1', size: '10', userId: 88);
      final response =
          await NMSChatApiRepository.to.fetchGroups(request: request);
      print('------my status------${response.status}------');
      if (response.status == 201) {
        _fetchGroupsDetails.value = response.data;

        if (_fetchGroupsDetails.isNotEmpty) {
          for (int i = 0; i < _fetchGroupsDetails.length; i++) {
            debugPrint('-----name------${fetchGroupsDetails[i].groupName}');
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
}
