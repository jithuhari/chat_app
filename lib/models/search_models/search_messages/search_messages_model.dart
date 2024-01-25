class MessageLinkData {
  Messages messages;
  Links links;

  MessageLinkData({
    required this.messages,
    required this.links,
  });

  factory MessageLinkData.fromJson(Map<String, dynamic> json) => MessageLinkData(
        messages: Messages.fromJson(json["messages"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "messages": messages.toJson(),
        "links": links.toJson(),
      };
}

class Messages {
  List<MessageDatum> data;
  SPagination messagesPagination;

  Messages({
    required this.data,
    required this.messagesPagination,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        data: List<MessageDatum>.from(json["data"].map((x) => MessageDatum.fromJson(x))),
        messagesPagination: SPagination.fromJson(json["messagesPagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "messagesPagination": messagesPagination.toJson(),
      };
}

class Links {
    List<LinksDatum> data;
    SPagination linksPagination;

    Links({
        required this.data,
        required this.linksPagination,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        data: List<LinksDatum>.from(json["data"].map((x) => LinksDatum.fromJson(x))),
        linksPagination: SPagination.fromJson(json["linksPagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "linksPagination": linksPagination.toJson(),
    };
}

class MessageDatum {
  int senderId;
  int receiverId;
  String userName;
  String lastMessageTime;

  String? message;

  MessageDatum({
    required this.senderId,
    required this.receiverId,
    required this.userName,
    required this.lastMessageTime,
    this.message,
  });

  factory MessageDatum.fromJson(Map<String, dynamic> json) => MessageDatum(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        userName: json["user_name"],
        lastMessageTime: json["last_message_time"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "user_name": userName,
        "last_message_time": lastMessageTime,
        "message": message,
      };
}

class LinksDatum {
  int senderId;
  int receiverId;
  String userName;
  String lastMessageTime;

  String? links;

  LinksDatum({
    required this.senderId,
    required this.receiverId,
    required this.userName,
    required this.lastMessageTime,
    this.links,
  });

  factory LinksDatum.fromJson(Map<String, dynamic> json) => LinksDatum(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        userName: json["user_name"],
        lastMessageTime: json["last_message_time"],
        links: json["links"],
      );

  Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "user_name": userName,
        "last_message_time": lastMessageTime,
        "links": links,
      };
}


class SPagination {
    int totalPages;
    int totalElements;
    int currentPage;
    String pageSize;

    SPagination({
        required this.totalPages,
        required this.totalElements,
        required this.currentPage,
        required this.pageSize,
    });

    factory SPagination.fromJson(Map<String, dynamic> json) => SPagination(
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
    );

    Map<String, dynamic> toJson() => {
        "totalPages": totalPages,
        "totalElements": totalElements,
        "currentPage": currentPage,
        "pageSize": pageSize,
    };
}
