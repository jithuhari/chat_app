class UsersListModelDatum {
  String userId;
  String firstName;
  String lastName;
  String? profileImgUrl;
  String workEmail;
  int probationPeriod;
  bool archived;
  String? workMobileNumber;
  int? id;

  String? email;
  String? phone;
  String? message;
  DateTime? lastMessageTime;

  UsersListModelDatum({
    required this.userId,
    this.profileImgUrl,
    required this.workEmail,
    required this.probationPeriod,
    required this.archived,
    this.workMobileNumber,
    this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.phone,
    this.message,
    this.lastMessageTime,
  });

  factory UsersListModelDatum.fromJson(Map<String, dynamic> json) =>
      UsersListModelDatum(
        userId: json["userId"],
        profileImgUrl: json["profileImgUrl"],
        workEmail: json["workEmail"],
        probationPeriod: json["probationPeriod"],
        archived: json["archived"],
        workMobileNumber: json["workMobileNumber"],
        id: json["id"],
        firstName: json["firstname"],
        lastName: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        message: json["message"],
        lastMessageTime: json["last_message_time"] == null
            ? null
            : DateTime.parse(json["last_message_time"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "profileImgUrl": profileImgUrl,
        "workEmail": workEmail,
        "probationPeriod": probationPeriod,
        "archived": archived,
        "workMobileNumber": workMobileNumber,
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
