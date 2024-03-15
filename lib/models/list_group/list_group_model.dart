class ListGroupModelData {
  int groupId;
  String groupName;
  int createdBy;
  String? lastMessage;
  String? lastMessageTime;

  ListGroupModelData({
    required this.groupId,
    required this.groupName,
    required this.createdBy,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory ListGroupModelData.fromJson(Map<String, dynamic> json) =>
      ListGroupModelData(
        groupId: json["group_id"],
        groupName: json["group_name"],
        createdBy: json["created_by"],
        lastMessage: json["last_message"],
        lastMessageTime: json["last_message_time"],
      );

  Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "group_name": groupName,
        "created_by": createdBy,
        "last_message": lastMessage,
        "last_message_time": lastMessageTime,
      };
}

class Pagination {
  int totalPages;
  int totalElements;
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
