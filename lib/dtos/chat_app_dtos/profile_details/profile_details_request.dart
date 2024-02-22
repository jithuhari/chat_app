class ProfileDetailsRequest {
  ProfileDetailsRequest({
    required this.userId,
  });

  String userId;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {
        "user_id": userId,
      },
    };
    return map;
  }
}
