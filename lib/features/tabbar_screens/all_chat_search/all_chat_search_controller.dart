import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../dtos/chat_app_dtos/nms_chat_list/nms_chat_list.dart';
import '../../../dtos/chat_app_dtos/search_dtos/search_contacts/search_contacts.dart';
import '../../../dtos/chat_app_dtos/search_dtos/search_messages/search_messages.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/chat_list/chat_list_model.dart';
import '../../../models/search_models/search_contacts/search_contacts_model.dart';
import '../../../models/search_models/search_messages/search_messages_model.dart';
import '../../../repository/nms_chat_api_repository.dart';
import '../../../utils/utils.dart';
import '../../chat_main_layout/chat_main_layout.dart';

class AllChatSearchController extends GetxController with SnackbarMixin {
  final ChatMainLayOutController chatMainLayoutController =
      Get.find<ChatMainLayOutController>();

  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;

  final _chatListModelData = (List<ChatData>.empty()).obs;
  List<ChatData> get chatListModelData => _chatListModelData;

  final _chatUserListLength = 1000.obs;
  int get chatUserListLength => _chatUserListLength.value;

  //search messages and links models

  final _searchMessageData = Rx<MessageLinkData?>(null);
  MessageLinkData? get searchMessageData => _searchMessageData.value;

  final _messageData = Rx<Messages?>(null);
  Messages? get messageData => _messageData.value;

  final _linksData = Rx<Links?>(null);
  Links? get linksData => _linksData.value;

  //search contact and nms contacts models

  final _searchContactsData = Rx<ChatAndNMsContactData?>(null);
  ChatAndNMsContactData? get searchContactsData => _searchContactsData.value;

  final _contactsData = Rx<Contacts?>(null);
  Contacts? get contactsData => _contactsData.value;

  final _nmsContactsData = Rx<Nmscontacts?>(null);
  Nmscontacts? get nmsContactsData => _nmsContactsData.value;

  final isDialOpen = ValueNotifier(false);

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isSeeMoreActive = false.obs;
  bool get isSeeMoreActive => _isSeeMoreActive.value;

  final _isSearchActive = false.obs;
  bool get isSearchActive => _isSearchActive.value;

  final _isContactAvailable = true.obs;
  bool get isContactAvailable => _isContactAvailable.value;

  final _isNmsContactAvailable = true.obs;
  bool get isNmsContactAvailable => _isNmsContactAvailable.value;

  final _sizeValue = 1.obs;
  int get sizeValue => _sizeValue.value;

  final _pageValue = 5.obs;
  int get pageValue => _pageValue.value;

  @override
  void onInit() async {
    await fetchChatList();
    // await searchMessageList();
    // await searchContactsList();

    super.onInit();
  }

  onSeeMorePaginationActive() {
    _isSeeMoreActive.value = true;

    // fetchChatList();
    update();
  }

  onSearchTap() {
    _isSearchActive.value = true;
    update();
  }

  onContactNotAvailable() {
    _isContactAvailable.value = false;
    update();
  }

  onContactAvailable() {
    _isContactAvailable.value = true;
    update();
  }

  onNmsContactNotAvailable() {
    _isNmsContactAvailable.value = false;
    update();
  }

  onNmsContactAvailable() {
    _isNmsContactAvailable.value = true;
    update();
  }

  onDissmissed() {}

  // search messages

  searchMessageList() async {
    _isLoading.value = true;
    //  print('option list---${chatMainLayoutController.contactsOptionList}');
    try {
      final request = SearchMessagesRequest(
        userId: '8',
        searchKey:
            // 'chat',
            chatMainLayoutController.chatSearchController.value.text,
        page: '1',
        size: '5',
        // options:
        // ["messages", "links"],
        // chatMainLayoutController.contactsOptionList.toList()
      );
      final response =
          await NMSChatApiRepository.to.searchMessagesList(request: request);
      if (response.status == 200) {
        _searchMessageData.value = response.data;
        debugPrint("Categorylist-- length  ${_searchMessageData.toJson()}");

        if (searchMessageData != null) {
          _messageData.value = searchMessageData!.messages;

          _linksData.value = searchMessageData!.links;

          if (messageData!.data.isNotEmpty) {
            debugPrint('contact mesage--- ${messageData!.data[0].message}');

            // debugPrint('nms contact userids--- ${linksData!.data[0].links}');
          } else if (messageData!.data.isEmpty && linksData!.data.isEmpty) {
            showErrorSnackbar(message: 'Both message and link data is empty');
          } else if (messageData!.data.isEmpty && linksData!.data.isNotEmpty) {
            showErrorSnackbar(message: 'message data is empty');
          } else if (messageData!.data.isNotEmpty && linksData!.data.isEmpty) {
            showErrorSnackbar(message: 'Link data is empty');
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

  // search contacts

  searchContactsList() async {
    _isLoading.value = true;
    try {
      final request = SearchContactsRequest(
        userId: '8',
        searchKey: chatMainLayoutController.chatSearchController.value.text,
        page: '1',
        size: '5',
        // options: ["contacts", "nmscontacts"]
      );
      final response =
          await NMSChatApiRepository.to.searchContactsList(request: request);
      if (response.status == 200) {
        _searchContactsData.value = response.data;
        debugPrint("Categorylist-- length  ${_searchContactsData.toJson()}");

        if (searchContactsData != null) {
          _contactsData.value = searchContactsData!.contacts;
          _nmsContactsData.value = searchContactsData!.nmscontacts;
          if (contactsData!.data.isNotEmpty) {
            // _contactsData.value = searchContactsData!.contacts;
            // _nmsContactsData.value = searchContactsData!.nmscontacts;
            debugPrint('contact mesage--- ${contactsData!.data[0].message}');

            debugPrint(
                'nms contact userids--- ${nmsContactsData!.data[0].userId}');
            await onContactAvailable();
            await onNmsContactAvailable();
          } else if (contactsData!.data.isEmpty &&
              nmsContactsData!.data.isEmpty) {
            await onContactNotAvailable();
            await onNmsContactNotAvailable();

            showErrorSnackbar(
                message: 'contact list and other contacts are empty');
          } else if (contactsData!.data.isNotEmpty &&
              nmsContactsData!.data.isEmpty) {
            await onContactAvailable();
            showErrorSnackbar(message: 'other contact list is empty');
          } else if (contactsData!.data.isEmpty &&
              nmsContactsData!.data.isNotEmpty) {
            showErrorSnackbar(message: 'contact list is empty');
          }
          // debugPrint('contact mesage--- ${contactsData!.data[0].message}');

          // debugPrint(
          //     'nms contact userids--- ${nmsContactsData!.data[0].userId}');
        } else {}
        _isLoading.value = false;
        update();
      }
    } catch (e) {
      // showErrorSnackbar(message: e.toString());
      // _isLoading.value = false;
      // debugPrint(e.toString());
      return catchErrorSection(e);
    }
  }

  fetchChatList() async {
    _isLoading.value = true;
    try {
      final request =
          NMSChatListRequest(senderId: '1', page: 1, size: chatUserListLength);
      final response =
          await NMSChatApiRepository.to.fetchChatList(request: request);
      if (response.status == 200) {
        _chatListModelData.value = response.data;

        debugPrint("Categorylist-- length  ${_chatListModelData.length}");
        if (_chatListModelData.isNotEmpty) {
          for (int i = 0; i < chatListModelData.length; i++) {
            _chatUserListLength.value = _chatListModelData.length;
            // Parse lastMessageTime string to DateTime
            DateTime lastMessageDateTime =
                DateTime.parse(chatListModelData[i].lastMessageTime.toString());

            // Add 5 hours and 30 minutes
            lastMessageDateTime = lastMessageDateTime.add(
              const Duration(hours: 5, minutes: 30),
            );

            // Get today's date
            DateTime now = DateTime.now();
            DateTime today = DateTime(now.year, now.month, now.day);

            // Calculate the date a week ago
            DateTime oneWeekAgo = today.subtract(const Duration(days: 7));

            // Format DateTime to a string with the desired format
            String formattedDate =
                DateFormat('dd/MM/yyyy').format(lastMessageDateTime);
            String formattedTime =
                DateFormat('HH:mm').format(lastMessageDateTime);

            // Check if the message was sent today
            if (lastMessageDateTime.isAfter(today)) {
              // String formattedDay = 'Today';
              // _formattedLastMessageTime.add(formattedDay);
              _formattedLastMessageTime.add(formattedTime);
            } else {
              // Check if the message was sent yesterday
              DateTime yesterday = today.subtract(const Duration(days: 1));
              if (lastMessageDateTime.isAfter(yesterday)) {
                String formattedDay = 'Yesterday';
                _formattedLastMessageTime.add(formattedDay);
              } else {
                // Check if the message was sent before a week
                if (lastMessageDateTime.isAfter(oneWeekAgo)) {
                  // If yes, show the date

                  String formattedDay =
                      DateFormat('EEEE').format(lastMessageDateTime);
                  _formattedLastMessageTime.add(formattedDay);
                } else {
                  // If not today, yesterday, or before a week, add the formatted time
                  _formattedLastMessageTime.add(formattedDate);
                }
              }
            }

            debugPrint('-----time/day------${_formattedLastMessageTime[i]}');
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

  catchErrorSection(e) async {
    debugPrint('error-----${e.toString()}------');

    if (e.toString().isNotEmpty) {
      try {
        Map<String, dynamic> errorResponse = jsonDecode(e.toString());

        if (errorResponse.containsKey("message")) {
          String errors = errorResponse["message"];

          if (errors.contains("Failed")) {
            showErrorSnackbar(
              message: minimumSearchCharacters,
            );
          }

          return;
        }
      } catch (e) {
        debugPrint('Error decoding JSON: ${e.toString()}');
        showErrorSnackbar(
          message: e.toString(),
        );
        return e.toString();
      }
    }
  }
}
