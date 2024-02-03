import '../../../models/new_chat/new_chat_model.dart';
import '../../api_response.dart';

class NMSNewChatListResponse extends ApiResponse {
  NMSNewChatListResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory NMSNewChatListResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return NMSNewChatListResponse(
      message: json["message"],
      status: json["status"],
      data: List<NewChatDatum>.from(
          json["data"].map((x) => NewChatDatum.fromJson(x))),
      // data:  ChatListModel.fromJson(json["data"]),
    );
  }
}
