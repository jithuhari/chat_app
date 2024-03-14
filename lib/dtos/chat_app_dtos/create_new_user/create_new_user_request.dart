class CreateNewUserRequest {
  CreateNewUserRequest({
    required this.userUniqueId,
    required this.orgId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.status,
    
  });

  String userUniqueId;
  String orgId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String phone;
  int status;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {
        "user_unique_id": userUniqueId,
        "orgId": orgId,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "status": status,
      },
    };
    return map;
  }
}
