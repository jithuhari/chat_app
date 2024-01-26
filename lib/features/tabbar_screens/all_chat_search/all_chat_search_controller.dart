import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../dtos/chat_app_dtos/search_dtos/search_contacts/search_contacts.dart';
import '../../../dtos/chat_app_dtos/search_dtos/search_messages/search_messages.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/search_models/search_contacts/search_contacts_model.dart';
import '../../../models/search_models/search_messages/search_messages_model.dart';
import '../../../repository/nms_chat_api_repository.dart';
import '../../chat_main_layout/chat_main_layout.dart';

class AllChatSearchController extends GetxController with SnackbarMixin {

  final ChatMainLayOutController chatMainLayoutController = Get.find<ChatMainLayOutController>();

  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;


  // final _contactsOptionList = (List<String>.empty()).obs;
  // List<String> get contactsOptionList => _contactsOptionList;

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

  final _sizeValue = 1.obs;
  int get sizeValue => _sizeValue.value;

  final _pageValue = 5.obs;
  int get pageValue => _pageValue.value;

  @override
  void onInit() async {
    // await fetchChatList();
    await searchMessageList();
    await searchContactsList();

    super.onInit();
  }

  onSeeMoreActive() {
    _isSeeMoreActive.value = true;
    
    // fetchChatList();
    update();
  }

  onDissmissed() {}

  // search messages

  searchMessageList() async {
    _isLoading.value = true;
     print('option list---${chatMainLayoutController.contactsOptionList}');
    try {
      final request = SearchMessagesRequest(
          userId: '8',
          searchKey: 'chat',
          page: '1',
          size: '5',
          options: 
          // ["messages", "links"],
          chatMainLayoutController.contactsOptionList.toList()
          );
      final response =
          await NMSChatApiRepository.to.searchMessagesList(request: request);
      if (response.status == 200) {
       
        _searchMessageData.value = response.data;
        debugPrint("Categorylist-- length  ${_searchMessageData.toJson()}");

        if (searchMessageData != null) {
          _messageData.value = searchMessageData!.messages;
          debugPrint('mesage--- ${messageData!.data[0].message}');
          _linksData.value = searchMessageData!.links;
          debugPrint('link--- ${linksData!.data[0].links}');
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
          searchKey: 'nim',
          page: '1',
          size: '5',
          options: ["contacts", "nmscontacts"]);
      final response =
          await NMSChatApiRepository.to.searchContactsList(request: request);
      if (response.status == 200) {
        _searchContactsData.value = response.data;
        debugPrint("Categorylist-- length  ${_searchContactsData.toJson()}");

        if (searchContactsData != null) {
          _contactsData.value = searchContactsData!.contacts;
          debugPrint('contact mesage--- ${contactsData!.data[0].message}');
          _nmsContactsData.value = searchContactsData!.nmscontacts;
          debugPrint('nms contact userids--- ${nmsContactsData!.data[0].userId}');
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
