import 'package:nms_chat/dtos/api_response.dart';

import '../../../models/login_screen/get_employ_model.dart';

class GetEmployResponse extends ApiResponse {
  GetEmployResponse({message, status, data, errors})
      : super(message: message, status: status, data: data, errors: errors);

  factory GetEmployResponse.fromJson(Map<String, dynamic> json) {
    return GetEmployResponse(
      message: json["message"],
      status: json["status"],
      // data: List<CorporateDetails>.from(
      //     json["data"].map((x) => CorporateDetails.fromJson(x))),
      data: GetEmployModel.fromJson(json["data"]),
    );
  }
}
