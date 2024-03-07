import '../../../models/pinned_message/pinned_message_model.dart';
import '../../api_response.dart';

class PinnedMessageResponse extends ApiResponse {
  PinnedMessageResponse({message, status, data})
      : super(message: message, status: status, data: data);

  factory PinnedMessageResponse.fromJson(Map<String, dynamic> json) {
    return PinnedMessageResponse(
      message: json["message"],
      status: json["status"],
      // data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
      data: PinnedMessageData.fromJson(json["data"]),
    );
  }
}
