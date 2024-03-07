// // To parse this JSON data, do
// //
// //     final pinnedMsgModel = pinnedMsgModelFromJson(jsonString);

// import 'dart:convert';

// PinnedMsgModel pinnedMsgModelFromJson(String str) => PinnedMsgModel.fromJson(json.decode(str));

// String pinnedMsgModelToJson(PinnedMsgModel data) => json.encode(data.toJson());

// class PinnedMsgModel {
//     String timestamp;
//     int status;
//     String message;
//     Data data;

//     PinnedMsgModel({
//         required this.timestamp,
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     factory PinnedMsgModel.fromJson(Map<String, dynamic> json) => PinnedMsgModel(
//         timestamp: json["timestamp"],
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "timestamp": timestamp,
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

class PinnedMessageData {
  int id;
  String chatId;
  int senderId;
  int receiverId;
  int isGroup;
  String message;
  dynamic fileName;
  dynamic filePath;
  int isEdited;
  int isDeleted;
  int isPinned;
  int repliedId;
  String createdAt;
  String updatedAt;
  int isViewed;

  PinnedMessageData({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.isGroup,
    required this.message,
    required this.fileName,
    required this.filePath,
    required this.isEdited,
    required this.isDeleted,
    required this.isPinned,
    required this.repliedId,
    required this.createdAt,
    required this.updatedAt,
    required this.isViewed,
  });

  factory PinnedMessageData.fromJson(Map<String, dynamic> json) =>
      PinnedMessageData(
        id: json["id"],
        chatId: json["chat_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        isGroup: json["is_group"],
        message: json["message"],
        fileName: json["file_name"],
        filePath: json["file_path"],
        isEdited: json["is_edited"],
        isDeleted: json["is_deleted"],
        isPinned: json["is_pinned"],
        repliedId: json["replied_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isViewed: json["is_viewed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "is_group": isGroup,
        "message": message,
        "file_name": fileName,
        "file_path": filePath,
        "is_edited": isEdited,
        "is_deleted": isDeleted,
        "is_pinned": isPinned,
        "replied_id": repliedId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "is_viewed": isViewed,
      };
}
