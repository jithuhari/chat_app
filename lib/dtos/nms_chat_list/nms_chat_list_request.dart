class NMSChatListRequest {
  NMSChatListRequest({
    required this.senderId,
    required this.page,
    required this.size,
  });

  String senderId;
  String page;
  String size;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {
        "sender_id": senderId,
      },
      "pagination": {"page": page, "size": size}
    };
    return map;
  }
}
