import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../dtos/chat_app_dtos/search_dtos/search_messages/search_messages.dart';
import '../../../mixins/snackbar_mixin.dart';
import '../../../models/chat_list/chat_list_model.dart';
import '../../../models/search_models/search_messages/search_messages_model.dart';
import '../../../repository/nms_chat_api_repository.dart';

class AllChatSearchController extends GetxController with SnackbarMixin {
  final _formattedLastMessageTime = (List<dynamic>.empty()).obs;
  List<dynamic> get formattedLastMessageTime => _formattedLastMessageTime;

  final _chatListModelData = (List<ChatData>.empty()).obs;
  List<ChatData> get chatListModelData => _chatListModelData;

  final _searchMessageData = Rx<MessageLinkData?>(null);
  MessageLinkData? get searchMessageData => _searchMessageData.value;

  final _messageData = Rx<Messages?>(null);
  Messages? get messageData => _messageData.value;

  final _linksData = Rx<Links?>(null);
  Links? get linksData => _linksData.value;

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
    try {
      final request = SearchMessagesRequest(
          userId: '8',
          searchKey: 'chat',
          page: '1',
          size: '5',
          options: ["messages", "links"]);
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
        }
         else {}
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
