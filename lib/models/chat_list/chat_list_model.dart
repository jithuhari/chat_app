class ChatData {
  int userId;
  String firstName;
  String lastName;
  dynamic profileImage;
  String message;
  DateTime lastMessageTime;
  String rowNum;
  String unReadMessageCount;

  ChatData(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.profileImage,
      required this.message,
      required this.lastMessageTime,
      required this.rowNum,
      required this.unReadMessageCount});

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
      userId: json["user_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      profileImage: json["profile_image"],
      message: json["message"],
      lastMessageTime: DateTime.parse(json["last_message_time"]),
      rowNum: json["row_num"],
      unReadMessageCount: json["unread_message_count"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage,
        "message": message,
        "last_message_time": lastMessageTime.toIso8601String(),
        "row_num": rowNum,
        "unread_message_count": unReadMessageCount
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
