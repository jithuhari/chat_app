class CreateGroupModelData {
  int groupId;
  String groupName;
  int createdBy;
  List<int> groupMembers;

  CreateGroupModelData({
    required this.groupId,
    required this.groupName,
    required this.createdBy,
    required this.groupMembers,
  });

  factory CreateGroupModelData.fromJson(Map<String, dynamic> json) =>
      CreateGroupModelData(
        groupId: json["group_id"],
        groupName: json["group_name"],
        createdBy: json["created_by"],
        groupMembers: List<int>.from(json["group_members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "group_name": groupName,
        "created_by": createdBy,
        "group_members": List<dynamic>.from(groupMembers.map((x) => x)),
      };
}
