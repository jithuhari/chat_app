class ProfileDetailsData {
    int id;
    String userName;
    String firstName;
    String lastName;
    String email;
    String phone;
    dynamic profileImage;
    int status;

    ProfileDetailsData({
        required this.id,
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.profileImage,
        required this.status,
    });

    factory ProfileDetailsData.fromJson(Map<String, dynamic> json) => ProfileDetailsData(
        id: json["id"],
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "profile_image": profileImage,
        "status": status,
    };
}
