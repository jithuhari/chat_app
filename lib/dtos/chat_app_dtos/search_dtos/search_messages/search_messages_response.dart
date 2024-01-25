import '../../../../models/search_models/search_messages/search_messages_model.dart';
import '../../../api_response.dart';

class SearchMessagesResponse extends ApiResponse {
  SearchMessagesResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory SearchMessagesResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return SearchMessagesResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ContactData>.from(
      //     json["data"].map((x) => ContactData.fromJson(x))),
      data:  MessageLinkData.fromJson(json["data"]),
      // data: List<SearchMessageData>.from(json["data"].map((x) => SearchMessageData.fromJson(x))),
    );
  }
}
