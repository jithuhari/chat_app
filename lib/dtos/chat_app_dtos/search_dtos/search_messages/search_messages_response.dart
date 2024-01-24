import '../../../../models/search_models/search_messages/search_messages_model.dart';
import '../../../api_response.dart';

class SearchMessageResponse extends ApiResponse {
  SearchMessageResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory SearchMessageResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return SearchMessageResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ContactData>.from(
      //     json["data"].map((x) => ContactData.fromJson(x))),
      // data:  ChatListModel.fromJson(json["data"]),
      data: List<SearchMessageData>.from(json["data"].map((x) => SearchMessageData.fromJson(x))),
    );
  }
}
