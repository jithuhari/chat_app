// class GetEmployModel {
//     String? timestamp;
//     String? requestId;
//     int? status;
//     String? message;
//     Data data;

//     GetEmployModel({
//          this.timestamp,
//          this.requestId,
//          this.status,
//          this.message,
//         required this.data,
//     });

//     factory GetEmployModel.fromJson(Map<String, dynamic> json) => GetEmployModel(
//         timestamp: json["timestamp"],
//         requestId: json["requestId"],
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "timestamp": timestamp,
//         "requestId": requestId,
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

class CorporateDetails {
  String employeeCode;
  String workMobileNumber;
  String workEmail;
  int dateOfFirstJoining;
  int joiningDate;
  String? employmentType;
  Designation designation;
  Department department;
  String? workLocation;
  String? employmentStatus;
  int probationPeriod;
  int salary;
  List<Project> projects;
  Data buddy;
  List<Data> managers;
  dynamic workStatus;
  int dailyWorkHours;
  int weeklyWorkHours;
  String shiftTime;

  CorporateDetails({
    required this.employeeCode,
    required this.workMobileNumber,
    required this.workEmail,
    required this.dateOfFirstJoining,
    required this.joiningDate,
    this.employmentType,
    required this.designation,
    required this.department,
    this.workLocation,
     this.employmentStatus,
    required this.probationPeriod,
    required this.salary,
    required this.projects,
    required this.buddy,
    required this.managers,
    required this.workStatus,
    required this.dailyWorkHours,
    required this.weeklyWorkHours,
    required this.shiftTime,
  });

  factory CorporateDetails.fromJson(Map<String, dynamic> json) =>
      CorporateDetails(
        employeeCode: json["employeeCode"],
        workMobileNumber: json["workMobileNumber"],
        workEmail: json["workEmail"],
        dateOfFirstJoining: json["dateOfFirstJoining"],
        joiningDate: json["joiningDate"],
        employmentType: json["employmentType"],
        designation: Designation.fromJson(json["designation"]),
        department: Department.fromJson(json["department"]),
        workLocation: json["workLocation"],
        employmentStatus: json["employmentStatus"],
        probationPeriod: json["probationPeriod"],
        salary: json["salary"],
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        buddy: Data.fromJson(json["buddy"]),
        managers:
            List<Data>.from(json["managers"].map((x) => Data.fromJson(x))),
        workStatus: json["workStatus"],
        dailyWorkHours: json["dailyWorkHours"],
        weeklyWorkHours: json["weeklyWorkHours"],
        shiftTime: json["shiftTime"],
      );

  Map<String, dynamic> toJson() => {
        "employeeCode": employeeCode,
        "workMobileNumber": workMobileNumber,
        "workEmail": workEmail,
        "dateOfFirstJoining": dateOfFirstJoining,
        "joiningDate": joiningDate,
        "employmentType": employmentType,
        "designation": designation.toJson(),
        "department": department.toJson(),
        "workLocation": workLocation,
        "employmentStatus": employmentStatus,
        "probationPeriod": probationPeriod,
        "salary": salary,
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "buddy": buddy.toJson(),
        "managers": List<dynamic>.from(managers.map((x) => x.toJson())),
        "workStatus": workStatus,
        "dailyWorkHours": dailyWorkHours,
        "weeklyWorkHours": weeklyWorkHours,
        "shiftTime": shiftTime,
      };
}

class Data {
  String userId;
  String? unitId;
  String? orgId;
  dynamic profileImg;
  dynamic profileImgUrl;
  PersonalDetails personalDetails;
  CorporateDetails? corporateDetails;
  bool? isActive;
  bool? isArchived;
  dynamic archiveDate;
  dynamic archiveType;
  dynamic archiveReason;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        unitId: json["unitId"],
        orgId: json["orgId"],
        profileImg: json["profileImg"],
        profileImgUrl: json["profileImgUrl"],
        personalDetails: PersonalDetails.fromJson(json["personalDetails"]),
        corporateDetails: json["corporateDetails"] == null
            ? null
            : CorporateDetails.fromJson(json["corporateDetails"]),
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
        "corporateDetails": corporateDetails?.toJson(),
        "isActive": isActive,
        "isArchived": isArchived,
        "archiveDate": archiveDate,
        "archiveType": archiveType,
        "archiveReason": archiveReason,
      };
}

class Department {
  int id;
  String departmentName;
  String departmentCode;

  Department({
    required this.id,
    required this.departmentName,
    required this.departmentCode,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["departmentName"],
        departmentCode: json["departmentCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departmentName": departmentName,
        "departmentCode": departmentCode,
      };
}

class Designation {
  int id;
  String designationName;

  Designation({
    required this.id,
    required this.designationName,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        id: json["id"],
        designationName: json["designationName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "designationName": designationName,
      };
}

class Project {
  int id;
  String projectName;
  String projectCode;

  Project({
    required this.id,
    required this.projectName,
    required this.projectCode,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        projectName: json["projectName"],
        projectCode: json["projectCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projectName": projectName,
        "projectCode": projectCode,
      };
}

class PersonalDetails {
  String firstname;
  String lastname;
  int? dateOfBirth;
  String? gender;
  String? personalMobileNumber;
  String? personalEmail;
  String? residentialAddress;
  String? bloodGroup;
  String? emergencyContact;
  String? bankAccountNumber;
  String? bankName;
  String? ifscCode;
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
