class ChatListModel {
    int userId;
    String userUniqueId;
    String orgId;
    String userName;
    String firstName;
    String lastName;
    String email;
    String phone;
    int status;
    dynamic profileImage;
    String createdAt;
    String updatedAt;
    String message;
    String lastMessageTime;
    String rowNum;

    ChatListModel({
        required this.userId,
        required this.userUniqueId,
        required this.orgId,
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.status,
        required this.profileImage,
        required this.createdAt,
        required this.updatedAt,
        required this.message,
        required this.lastMessageTime,
        required this.rowNum,
    });

    factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        userId: json["user_id"],
        userUniqueId: json["user_unique_id"],
        orgId: json["orgId"],
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        message: json["message"],
        lastMessageTime: json["last_message_time"],
        rowNum: json["row_num"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_unique_id": userUniqueId,
        "orgId": orgId,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "status": status,
        "profile_image": profileImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "message": message,
        "last_message_time": lastMessageTime,
        "row_num": rowNum,
    };
}
