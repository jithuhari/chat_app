import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dtos/chat_app_dtos/nms_chat_list/nms_chat_list.dart';
import '../dtos/chat_app_dtos/search_dtos/search_contacts/search_contacts.dart';
import '../dtos/chat_app_dtos/search_dtos/search_messages/search_messages.dart';
import '../managers/api/api.dart';
import '../managers/api/nms_chat_api_base_helper.dart';

abstract class NMSChatApiRepository extends GetxController {
  static NMSChatApiRepository get to => Get.find();

  Future<NMSChatListResponse> fetchChatList(
      {required NMSChatListRequest request});

  Future<SearchContactsResponse> searchContactsList(
      {required SearchContactsRequest request});
  Future<SearchMessagesResponse> searchMessagesList(
      {required SearchMessagesRequest request});    
}

class NMSApiRepositoryImpl extends GetxController
    implements NMSChatApiRepository {
  final _helper = NMSChatApiBaseHelper();

  final Map<String, String> _headersWithoutToken = {
    'Content-Type': 'application/json',
  };

  //fetch chat list in chat page
  @override
  Future<NMSChatListResponse> fetchChatList(
      {required NMSChatListRequest request}) async {
    final response = await _helper.postWithBody(
      headers: _headersWithoutToken,
      endpoint: ApiEndPoints.chatList,
      params: {},
      body: request.toBody(),
    );
    debugPrint("response $response");
    return NMSChatListResponse.fromJson(response);
  }

  //search api for contacts
  @override
  Future<SearchContactsResponse> searchContactsList(
      {required SearchContactsRequest request}) async {
    final response = await _helper.postWithBody(
      // headers: _headersWithoutToken,
      endpoint: ApiEndPoints.searchContact,
      params: {},
      body: request.toBody(),
    );
    debugPrint("response $response");
    return SearchContactsResponse.fromJson(response);
  }

  //search api for messages
  @override
  Future<SearchMessagesResponse> searchMessagesList(
      {required SearchMessagesRequest request}) async {
    final response = await _helper.postWithBody(
      // headers: _headersWithoutToken,
      endpoint: ApiEndPoints.searchMessage,
      params: {},
      body: request.toBody(),
    );
    
    return SearchMessagesResponse.fromJson(response);
  }
}
