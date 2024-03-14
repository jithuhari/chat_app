import '../../../models/create_new_user/create_new_user_model.dart';
import '../../api_response.dart';

class CreateNewUserResponse extends ApiResponse {
  CreateNewUserResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory CreateNewUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateNewUserResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
      data: CreateNewUserModelData.fromJson(json["data"]),
    );
  }
}
