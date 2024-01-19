class GetEmpoyRequest {
  String? userId;

  GetEmpoyRequest({this.userId});

  dynamic toMap() {
    return userId;
  }
}