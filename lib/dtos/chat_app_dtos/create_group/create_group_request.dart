class CreateGroupRequest {
  CreateGroupRequest({
    required this.groupName,
    required this.createdBy,
    required this.groupMembers
  });

  String groupName;
  int createdBy;
  List<int> groupMembers;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {
        "group_name": groupName,
        "created_by": groupName,
        "group_members": groupMembers,
      },
    };
    return map;
  }
}