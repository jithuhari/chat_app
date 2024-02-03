class ChatAndNMsContactData {
  Contacts? contacts;
  Nmscontacts? nmscontacts;

  ChatAndNMsContactData({
     this.contacts,
     this.nmscontacts,
  });

  factory ChatAndNMsContactData.fromJson(Map<String, dynamic> json) =>
      ChatAndNMsContactData(
        contacts: Contacts.fromJson(json["contacts"]),
        nmscontacts: Nmscontacts.fromJson(json["nmscontacts"]),
      );

  Map<String, dynamic> toJson() => {
        "contacts": contacts!.toJson(),
        "nmscontacts": nmscontacts!.toJson(),
      };
}

class Contacts {
  List<ContactsDatum> data;
  ContactsPagination pagination;

  Contacts({
    required this.data,
    required this.pagination,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        data: List<ContactsDatum>.from(
            json["data"].map((x) => ContactsDatum.fromJson(x))),
        pagination: ContactsPagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class ContactsDatum {
  int userId;
  String userUniqueId;
  String orgId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String phone;
  int status;
  dynamic profileImage;
  String createdAt;
  String updatedAt;
  String message;
  String lastMessageTime;
  String rowNum;
  String totalRows;

  ContactsDatum({
    required this.userId,
    required this.userUniqueId,
    required this.orgId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.status,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
    required this.lastMessageTime,
    required this.rowNum,
    required this.totalRows,
  });

  factory ContactsDatum.fromJson(Map<String, dynamic> json) => ContactsDatum(
        userId: json["user_id"],
        userUniqueId: json["user_unique_id"],
        orgId: json["orgId"],
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        message: json["message"],
        lastMessageTime: json["last_message_time"],
        rowNum: json["row_num"],
        totalRows: json["total_rows"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_unique_id": userUniqueId,
        "orgId": orgId,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "status": status,
        "profile_image": profileImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "message": message,
        "last_message_time": lastMessageTime,
        "row_num": rowNum,
        "total_rows": totalRows,
      };
}

class ContactsPagination {
  int totalPages;
  int totalElements;
  String currentPage;
  String pageSize;

  ContactsPagination({
    required this.totalPages,
    required this.totalElements,
    required this.currentPage,
    required this.pageSize,
  });

  factory ContactsPagination.fromJson(Map<String, dynamic> json) =>
      ContactsPagination(
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

class Nmscontacts {
  List<NmscontactsDatum> data;
  NMSContactsPagination pagination;

  Nmscontacts({
    required this.data,
    required this.pagination,
  });

  factory Nmscontacts.fromJson(Map<String, dynamic> json) => Nmscontacts(
        data: List<NmscontactsDatum>.from(
            json["data"].map((x) => NmscontactsDatum.fromJson(x))),
        pagination: NMSContactsPagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class NmscontactsDatum {
  String userId;
  dynamic unitId;
  dynamic orgId;
  dynamic profileImg;
  dynamic profileImgUrl;
  PersonalDetails personalDetails;
  dynamic corporateDetails;
  dynamic isActive;
  dynamic isArchived;
  dynamic archiveDate;
  dynamic archiveType;
  dynamic archiveReason;

  NmscontactsDatum({
    required this.userId,
    required this.unitId,
    required this.orgId,
    required this.profileImg,
    required this.profileImgUrl,
    required this.personalDetails,
    required this.corporateDetails,
    required this.isActive,
    required this.isArchived,
    required this.archiveDate,
    required this.archiveType,
    required this.archiveReason,
  });

  factory NmscontactsDatum.fromJson(Map<String, dynamic> json) =>
      NmscontactsDatum(
        userId: json["userId"],
        unitId: json["unitId"],
        orgId: json["orgId"],
        profileImg: json["profileImg"],
        profileImgUrl: json["profileImgUrl"],
        personalDetails: PersonalDetails.fromJson(json["personalDetails"]),
        corporateDetails: json["corporateDetails"],
        isActive: json["isActive"],
        isArchived: json["isArchived"],
        archiveDate: json["archiveDate"],
        archiveType: json["archiveType"],
        archiveReason: json["archiveReason"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "unitId": unitId,
        "orgId": orgId,
        "profileImg": profileImg,
        "profileImgUrl": profileImgUrl,
        "personalDetails": personalDetails.toJson(),
        "corporateDetails": corporateDetails,
        "isActive": isActive,
        "isArchived": isArchived,
        "archiveDate": archiveDate,
        "archiveType": archiveType,
        "archiveReason": archiveReason,
      };
}

class NMSContactsPagination {
  int totalPages;
  int totalElements;
  String currentPage;
  String pageSize;

  NMSContactsPagination({
    required this.totalPages,
    required this.totalElements,
    required this.currentPage,
    required this.pageSize,
  });

  factory NMSContactsPagination.fromJson(Map<String, dynamic> json) =>
      NMSContactsPagination(
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

class PersonalDetails {
  String firstname;
  String lastname;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic personalMobileNumber;
  dynamic personalEmail;
  dynamic residentialAddress;
  dynamic bloodGroup;
  dynamic emergencyContact;
  dynamic bankAccountNumber;
  dynamic bankName;
  dynamic ifscCode;
  dynamic panNumber;
  dynamic aadhaarNumber;
  dynamic esiNumber;
  dynamic providentFundNumber;
  dynamic medicalInsuranceNumber;

  PersonalDetails({
    required this.firstname,
    required this.lastname,
    required this.dateOfBirth,
    required this.gender,
    required this.personalMobileNumber,
    required this.personalEmail,
    required this.residentialAddress,
    required this.bloodGroup,
    required this.emergencyContact,
    required this.bankAccountNumber,
    required this.bankName,
    required this.ifscCode,
    required this.panNumber,
    required this.aadhaarNumber,
    required this.esiNumber,
    required this.providentFundNumber,
    required this.medicalInsuranceNumber,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) =>
      PersonalDetails(
        firstname: json["firstname"],
        lastname: json["lastname"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        personalMobileNumber: json["personalMobileNumber"],
        personalEmail: json["personalEmail"],
        residentialAddress: json["residentialAddress"],
        bloodGroup: json["bloodGroup"],
        emergencyContact: json["emergencyContact"],
        bankAccountNumber: json["bankAccountNumber"],
        bankName: json["bankName"],
        ifscCode: json["ifscCode"],
        panNumber: json["panNumber"],
        aadhaarNumber: json["aadhaarNumber"],
        esiNumber: json["esiNumber"],
        providentFundNumber: json["providentFundNumber"],
        medicalInsuranceNumber: json["medicalInsuranceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "personalMobileNumber": personalMobileNumber,
        "personalEmail": personalEmail,
        "residentialAddress": residentialAddress,
        "bloodGroup": bloodGroup,
        "emergencyContact": emergencyContact,
        "bankAccountNumber": bankAccountNumber,
        "bankName": bankName,
        "ifscCode": ifscCode,
        "panNumber": panNumber,
        "aadhaarNumber": aadhaarNumber,
        "esiNumber": esiNumber,
        "providentFundNumber": providentFundNumber,
        "medicalInsuranceNumber": medicalInsuranceNumber,
      };
}
