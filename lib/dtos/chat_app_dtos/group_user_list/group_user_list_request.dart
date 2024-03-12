class NMSGroupUserListRequest {
  NMSGroupUserListRequest({
    required this.senderId,
    required this.workEmail,
    required this.workMobileNumber,
    required this.workLocation,
    required this.field,
    required this.sortOrder,
    required this.page,
    required this.size,
  });

  String senderId;
  String workEmail;
  String workMobileNumber;
  String workLocation;
  String field;
  String sortOrder;
  int page;
  int size;

  Map<String, dynamic> toBody() {
    final map = {
      "sender_id": senderId,
      "sortBy": {"field": field, "sortOrder": sortOrder},
      "pagination": {"page": page, "size": size},
      "data": [workEmail, workMobileNumber, workLocation]
    };
    return map;
  }
}
