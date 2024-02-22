import '../../../models/profile_Details/profile_details_model.dart';
import '../../api_response.dart';

class ProfileDetailsResponse extends ApiResponse {
  ProfileDetailsResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory ProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProfileDetailsResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
      data:  ProfileDetailsData.fromJson(json["data"]),
    );
  }
}


