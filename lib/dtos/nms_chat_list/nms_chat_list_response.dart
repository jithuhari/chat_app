import '../../models/chat_list/chat_list_model.dart';
import '../api_response.dart';

class NMSChatListResponse extends ApiResponse {
  NMSChatListResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory NMSChatListResponse.fromJson(Map<String, dynamic> json) =>
      NMSChatListResponse(
          message: json["message"],
          status: json["status"],
          data: ChatListModel.fromJson(json["data"]));
}
