class ChatData {
  int? userId;
  String? firstName;
  String? lastName;
  dynamic profileImage;
  String? message;
  DateTime lastMessageTime;
  String? rowNum;
  String? unReadMessageCount;
  String? lastSeen;
  int isGroup;
  int? groupId;
  String? groupName;
  int? createdBy;
  String? lastMessage;

  ChatData(
      {required this.userId,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.message,
      required this.lastMessageTime,
      this.rowNum,
      this.unReadMessageCount,
      this.lastSeen,
      required this.isGroup,
      this.groupId,
      this.groupName,
      this.createdBy,
      this.lastMessage});

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
      userId: json["user_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      profileImage: json["profile_image"],
      message: json["message"],
      lastMessageTime: DateTime.parse(json["last_message_time"]),
      rowNum: json["row_num"],
      unReadMessageCount: json["unread_message_count"],
      lastSeen: json["last_seen"],
      isGroup: json["is_group"],
      groupId: json["group_id"],
      groupName: json["group_name"],
      createdBy: json["created_by"],
      lastMessage: json["last_message"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage,
        "message": message,
        "last_message_time": lastMessageTime.toIso8601String(),
        "row_num": rowNum,
        "unread_message_count": unReadMessageCount,
        "last_seen": lastSeen,
        "is_group": isGroup,
        "group_id": groupId,
        "group_name": groupName,
        "created_by": createdBy,
        "last_message": lastMessage
      };
}

class Pagination {
  int totalPages;
  String totalElements;
  String currentPage;
  String pageSize;

  Pagination({
    required this.totalPages,
    required this.totalElements,
    required this.currentPage,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "totalPages": totalPages,
        "totalElements": totalElements,
        "currentPage": currentPage,
        "pageSize": pageSize,
      };
}
