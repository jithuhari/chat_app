import '../../../models/list_group/list_group_model.dart';
import '../../api_response.dart';

class ListGroupResponse extends ApiResponse {
  ListGroupResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory ListGroupResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupResponse(
      message: json["message"],
      status: json["status"],
      data: List<ListGroupModelData>.from(
          json["data"].map((x) => ListGroupModelData.fromJson(x))),
    );
  }
}
