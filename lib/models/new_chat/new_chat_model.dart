class NewChatDatum {
  String userId;
  String firstname;
  String lastname;
  String workEmail;
  String workMobileNumber;
  int probationPeriod;
  bool archived;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? message;
  DateTime? lastMessageTime;

  NewChatDatum({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.workEmail,
    required this.workMobileNumber,
    required this.probationPeriod,
    required this.archived,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.message,
    this.lastMessageTime,
  });

  factory NewChatDatum.fromJson(Map<String, dynamic> json) => NewChatDatum(
        userId: json["userId"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        workEmail: json["workEmail"],
        workMobileNumber: json["workMobileNumber"],
        probationPeriod: json["probationPeriod"],
        archived: json["archived"],
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        message: json["message"],
        lastMessageTime: json["last_message_time"] == null
            ? null
            : DateTime.parse(json["last_message_time"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstname": firstname,
        "lastname": lastname,
        "workEmail": workEmail,
        "workMobileNumber": workMobileNumber,
        "probationPeriod": probationPeriod,
        "archived": archived,
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "message": message,
        "last_message_time": lastMessageTime?.toIso8601String(),
      };
}

class Pagination {
  int totalPages;
  int totalElements;
  int currentPage;
  int pageSize;

  Pagination({
    required this.totalPages,
    required this.totalElements,
    required this.currentPage,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
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
