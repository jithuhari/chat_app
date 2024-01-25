import '../../../../models/search_models/search_contacts/search_contacts_model.dart';
import '../../../api_response.dart';

class SearchContactsResponse extends ApiResponse {
  SearchContactsResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory SearchContactsResponse.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is not null before calling ChatListModel.fromJson
    return SearchContactsResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ContactData>.from(
      //     json["data"].map((x) => ContactData.fromJson(x))),
      data: ChatAndNMsContactData.fromJson(json["data"]),
    );
  }
}
