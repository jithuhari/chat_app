class ListGroupRequest {
  ListGroupRequest({
    required this.userId,
    required this.page,
    required this.size,
  });

  int userId;
  String page;
  String size;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {"user_id": userId},
      "pagination": {"page": page, "size": size},
    };
    return map;
  }
}
