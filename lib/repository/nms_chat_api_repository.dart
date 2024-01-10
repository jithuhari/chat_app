import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dtos/nms_chat_list/nms_chat_list.dart';
import '../managers/api/api.dart';
import '../managers/api/nms_chat_api_base_helper.dart';

abstract class NMSChatApiRepository extends GetxController {
  static NMSChatApiRepository get to => Get.find();

  Future<NMSChatListResponse> fetchChatList(
      {required NMSChatListRequest request});
}

class NMSApiRepositoryImpl extends GetxController implements NMSChatApiRepository {
  final _helper = NMSChatApiBaseHelper();

  final Map<String, String> _headersWithoutToken = {
    'Content-Type': 'application/json',
  };

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
}
