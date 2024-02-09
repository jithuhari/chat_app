class HistoricalMessagesModel {
  List<HistoricalMessage> historicalMessages;

  HistoricalMessagesModel({
    required this.historicalMessages,
  });

  factory HistoricalMessagesModel.fromJson(Map<String, dynamic> json) =>
      HistoricalMessagesModel(
        historicalMessages: List<HistoricalMessage>.from(
            json["historicalMessages"]
                .map((x) => HistoricalMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "historicalMessages":
            List<dynamic>.from(historicalMessages.map((x) => x.toJson())),
      };
}

class HistoricalMessage {
  int messageId;
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
  DateTime messageCreatedAt;
  DateTime messageUpdatedAt;
  List<dynamic> reactions;

  HistoricalMessage({
    required this.messageId,
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
    required this.messageCreatedAt,
    required this.messageUpdatedAt,
    required this.reactions,
  });

  factory HistoricalMessage.fromJson(Map<String, dynamic> json) =>
      HistoricalMessage(
        messageId: json["message_id"],
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
        messageCreatedAt: DateTime.parse(json["message_created_at"]),
        messageUpdatedAt: DateTime.parse(json["message_updated_at"]),
        reactions: List<dynamic>.from(json["reactions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
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
        "message_created_at": messageCreatedAt.toIso8601String(),
        "message_updated_at": messageUpdatedAt.toIso8601String(),
        "reactions": List<dynamic>.from(reactions.map((x) => x)),
      };
}
