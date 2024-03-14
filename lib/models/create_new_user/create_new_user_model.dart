class CreateNewUserModelData {
  int id;
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
  dynamic lastSeen;

  CreateNewUserModelData({
    required this.id,
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
    required this.lastSeen,
  });

  factory CreateNewUserModelData.fromJson(Map<String, dynamic> json) =>
      CreateNewUserModelData(
        id: json["id"],
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
        lastSeen: json["last_seen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "last_seen": lastSeen,
      };
}
