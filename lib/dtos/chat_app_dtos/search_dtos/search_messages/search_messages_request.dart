class SearchMessagesRequest {
  SearchMessagesRequest(
      {required this.userId,
      required this.searchKey,
      required this.options,
      required this.page,
      required this.size});

  String userId;
  String searchKey;
  List<String> options;
  String page;
  String size;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {"user_id": userId, "search_key": searchKey, "options": options},
      "nmsPagination": {"page": page, "size": size},
      "contactsPagination": {"page": page, "size": size}
    };
    return map;
  }
}
