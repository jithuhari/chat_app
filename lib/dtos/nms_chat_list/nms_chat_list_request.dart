class NMSChatListRequest {
  String senderId;

  NMSChatListRequest({
    required this.senderId,
  });

  Map<String, String> toMap() {
    return {
      'senderId': senderId,
    };
  }
}
