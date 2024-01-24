// // class MessagesSearchModel {
// //     String timestamp;
// //     int status;
// //     String message;
// //     Data data;

// //     MessagesSearchModel({
// //         required this.timestamp,
// //         required this.status,
// //         required this.message,
// //         required this.data,
// //     });

// // }

// class SearchMessageData {
//     Messages messages;
//     Links links;

//     SearchMessageData({
//         required this.messages,
//         required this.links,
//     });

// }

// class Links {
//     List<SearchMsgData> data;
//     SPagination linksPagination;

//     Links({
//         required this.data,
//         required this.linksPagination,
//     });

// }

// class SearchMsgData {
//     int senderId;
//     int receiverId;
//     String userName;
//     DateTime lastMessageTime;
//     String? links;
//     String? message;

//     SearchMsgData({
//         required this.senderId,
//         required this.receiverId,
//         required this.userName,
//         required this.lastMessageTime,
//         this.links,
//         this.message,
//     });

// }

// class SPagination {
//     int totalPages;
//     int totalElements;
//     int currentPage;
//     String pageSize;

//     SPagination({
//         required this.totalPages,
//         required this.totalElements,
//         required this.currentPage,
//         required this.pageSize,
//     });

// }

// class Messages {
//     List<SearchMsgData> data;
//     SPagination messagesPagination;

//     Messages({
//         required this.data,
//         required this.messagesPagination,
//     });

// }


// To parse this JSON data, do
//
//     final messagesSearchModel = messagesSearchModelFromJson(jsonString);



class Data {
    Messages messages;
    Links links;

    Data({
        required this.messages,
        required this.links,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        messages: Messages.fromJson(json["messages"]),
        links: Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "messages": messages.toJson(),
        "links": links.toJson(),
    };
}

class Links {
    List<SearchMessageData> data;
    SPagination linksPagination;

    Links({
        required this.data,
        required this.linksPagination,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        data: List<SearchMessageData>.from(json["data"].map((x) => SearchMessageData.fromJson(x))),
        linksPagination: SPagination.fromJson(json["linksPagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "linksPagination": linksPagination.toJson(),
    };
}

class SearchMessageData {
    int senderId;
    int receiverId;
    String userName;
    DateTime lastMessageTime;
    String? links;
    String? message;

    SearchMessageData({
        required this.senderId,
        required this.receiverId,
        required this.userName,
        required this.lastMessageTime,
        this.links,
        this.message,
    });

    factory SearchMessageData.fromJson(Map<String, dynamic> json) => SearchMessageData(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        userName: json["user_name"],
        lastMessageTime: DateTime.parse(json["last_message_time"]),
        links: json["links"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "user_name": userName,
        "last_message_time": lastMessageTime.toIso8601String(),
        "links": links,
        "message": message,
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

class Messages {
    List<SearchMessageData> data;
    SPagination messagesPagination;

    Messages({
        required this.data,
        required this.messagesPagination,
    });

    factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        data: List<SearchMessageData>.from(json["data"].map((x) => SearchMessageData.fromJson(x))),
        messagesPagination: SPagination.fromJson(json["messagesPagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "messagesPagination": messagesPagination.toJson(),
    };
}
