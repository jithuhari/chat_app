import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dtos/chat_app_dtos/new_chat/nms_new_chat.dart';
import '../dtos/chat_app_dtos/nms_chat_list/nms_chat_list.dart';
import '../dtos/chat_app_dtos/pinned_message/pinned_message.dart';
import '../dtos/chat_app_dtos/profile_details/profile_details.dart';
import '../dtos/chat_app_dtos/search_dtos/search_contacts/search_contacts.dart';
import '../dtos/chat_app_dtos/search_dtos/search_messages/search_messages.dart';
import '../managers/api/api.dart';
import '../managers/api/nms_chat_api_base_helper.dart';

abstract class NMSChatApiRepository extends GetxController {
  static NMSChatApiRepository get to => Get.find();

  Future<NMSChatListResponse> fetchChatList(
      {required NMSChatListRequest request});

      Future<NMSNewChatListResponse> fetchNewChatList(
      {required NMSNewChatListRequest request});

  Future<SearchContactsResponse> searchContactsList(
      {required SearchContactsRequest request});
  Future<SearchMessagesResponse> searchMessagesList(
      {required SearchMessagesRequest request});

  Future<ProfileDetailsResponse> profileDetails(
      {required ProfileDetailsRequest request});

  
  Future<PinnedMessageResponse> pinnedMessage(
      {required PinnedMessageRequest request});         
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

  //fetch new chat list in chat page
  @override
  Future<NMSNewChatListResponse> fetchNewChatList(
      {required NMSNewChatListRequest request}) async {
    final response = await _helper.postWithBody(
      // headers: _headersWithoutToken,
      endpoint: ApiEndPoints.newChatList,
      params: {},
      body: request.toBody(),
    );
    debugPrint("response $response");
    return NMSNewChatListResponse.fromJson(response);
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

  //profile details api

   @override
  Future<ProfileDetailsResponse> profileDetails(
      {required ProfileDetailsRequest request}) async {
    final response = await _helper.postWithBody(
      // headers: _headersWithoutToken,
      endpoint: ApiEndPoints.profileDetails,
      params: {},
      body: request.toBody(),
    );
    
    return ProfileDetailsResponse.fromJson(response);
  }

   @override
  Future<PinnedMessageResponse> pinnedMessage(
      {required PinnedMessageRequest request}) async {
    final response = await _helper.postWithBody(
      // headers: _headersWithoutToken,
      endpoint: ApiEndPoints.pinnedMsg,
      params: {},
      body: request.toBody(),
    );
    
    return PinnedMessageResponse.fromJson(response);
  }
}
