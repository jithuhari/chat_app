import '../../../models/new_chat/new_chat_model.dart';
import '../../api_response.dart';

class NMSGroupUserListResponse extends ApiResponse {
  NMSGroupUserListResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory NMSGroupUserListResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return NMSGroupUserListResponse(
      message: json["message"],
      status: json["status"],
      data: List<UsersListModelDatum>.from(
          json["data"].map((x) => UsersListModelDatum.fromJson(x))),
      // data:  ChatListModel.fromJson(json["data"]),
    );
  }
}
