import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
}
