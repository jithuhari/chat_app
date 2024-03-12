import '../../../models/create_group/create_group_model.dart';
import '../../api_response.dart';

class CreateGroupResponse extends ApiResponse {
  CreateGroupResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
      data: CreateGroupModelData.fromJson(json["data"]),
    );
  }
}
