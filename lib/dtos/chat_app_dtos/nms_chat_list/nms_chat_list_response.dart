import '../../../models/chat_list/chat_list_model.dart';
import '../../api_response.dart';

class NMSChatListResponse extends ApiResponse {
  NMSChatListResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory NMSChatListResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return NMSChatListResponse(
      message: json["message"],
      status: json["status"],
      data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
      // data:  ChatListModel.fromJson(json["data"]),
    );
  }
}


