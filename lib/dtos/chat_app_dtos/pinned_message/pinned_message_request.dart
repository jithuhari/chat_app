class PinnedMessageRequest {
  PinnedMessageRequest({
    required this.senderId,
    required this.pinnedId,
    required this.receiverId,
  });

  int senderId;
  int pinnedId;
  int receiverId;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {
        "sender_id": senderId,
        "pinned_id": pinnedId,
        "receiver_id": receiverId,
      },
    };
    return map;
  }
}
