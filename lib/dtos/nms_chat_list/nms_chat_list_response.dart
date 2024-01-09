// import '../../models/chat_list/chat_list_model.dart';
// import '../api_response.dart';

// class NMSChatListResponse extends ApiResponse {
//   NMSChatListResponse({message, status, data})
//       : super(message: message, status: status, data: data);

//   factory NMSChatListResponse.fromJson(Map<String, dynamic> json) {
//     // Check if 'data' is not null before calling ChatListModel.fromJson
//     return NMSChatListResponse(
//       message: json["message"],
//       status: json["status"],
//       data: json["data"] != null ? ChatListModel.fromJson(json["data"]) : null,
//     );
//   }
// }

import '../../models/chat_list/chat_list_model.dart';
import '../api_response.dart';

class NMSChatListResponse extends ApiResponse {
  NMSChatListResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory NMSChatListResponse.fromJson(List<dynamic> json) {
    // Check if the list is not empty
    if (json.isNotEmpty) {
      // Map each item in the list to a ChatListModel
      final List<ChatListModel> chatList = json.map((item) {
        return ChatListModel(
          userId: item["user_id"],
          userUniqueId: item["user_unique_id"],
          orgId: item["orgId"],
          userName: item["user_name"],
          firstName: item["first_name"],
          lastName: item["last_name"],
          email: item["email"],
          phone: item["phone"],
          status: item["status"],
          profileImage: item["profile_image"],
          createdAt: item["created_at"],
          updatedAt: item["updated_at"],
          message: item["message"],
          lastMessageTime: item["last_message_time"],
          rowNum: item["row_num"],
        );
      }).toList();

      return NMSChatListResponse(
        message: "", // You might want to modify this based on your API response
        status: 200, // You might want to modify this based on your API response
        data: chatList,
      );
    } else {
      // Handle the case when the list is empty
      return NMSChatListResponse(message: "", status: 200, data: null);
    }
  }
}
