class SearchMessagesRequest {
  SearchMessagesRequest(
      {required this.userId,
      required this.searchKey,
       this.options,
      required this.page,
      required this.size});

  String userId;
  String searchKey;
  List<String>? options;
  String page;
  String size;

  Map<String, dynamic> toBody() {
    final map = {
      "data": {"user_id": userId, "search_key": searchKey, "options": options},
      "messagesPagination": {"page": page, "size": size},
      "linksPagination": {"page": page, "size": size}
    };
    return map;
  }
}
