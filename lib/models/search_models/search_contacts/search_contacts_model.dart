// // To parse this JSON data, do
// //
// //     final contactsSearchModel = contactsSearchModelFromJson(jsonString);

// import 'dart:convert';

// ContactsSearchModel contactsSearchModelFromJson(String str) => ContactsSearchModel.fromJson(json.decode(str));

// String contactsSearchModelToJson(ContactsSearchModel data) => json.encode(data.toJson());

// class ContactsSearchModel {
//     String timestamp;
//     int status;
//     String message;
//     Data data;

//     ContactsSearchModel({
//         required this.timestamp,
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     factory ContactsSearchModel.fromJson(Map<String, dynamic> json) => ContactsSearchModel(
//         timestamp: json["timestamp"],
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "timestamp": timestamp,
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

class ContactData {
    Contacts contacts;
    Contacts nmscontacts;

    ContactData({
        required this.contacts,
        required this.nmscontacts,
    });

    factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
        contacts: Contacts.fromJson(json["contacts"]),
        nmscontacts: Contacts.fromJson(json["nmscontacts"]),
    );

    Map<String, dynamic> toJson() => {
        "contacts": contacts.toJson(),
        "nmscontacts": nmscontacts.toJson(),
    };
}

class Contacts {
    List<SearchContactData> data;
    Pagination pagination;

    Contacts({
        required this.data,
        required this.pagination,
    });

    factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        data: List<SearchContactData>.from(json["data"].map((x) => SearchContactData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class SearchContactData {
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

    SearchContactData({
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

    factory SearchContactData.fromJson(Map<String, dynamic> json) => SearchContactData(
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

    factory PersonalDetails.fromJson(Map<String, dynamic> json) => PersonalDetails(
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

class Pagination {
    int totalPages;
    int totalElements;
    String currentPage;
    String pageSize;

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
