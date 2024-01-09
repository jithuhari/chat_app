import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMainLayOutController extends GetxController {
  final items = [
    "Contacts",
    "Message",
    "groups",
    "Documents",
    "Links",
  ];

  List<String> selectedItem = [];

  final TextEditingController chatSearchController = TextEditingController();

  final _searchDisplayValue = false.obs;
  bool get searchDisplayValue => _searchDisplayValue.value;

  searchDisplay() {
    _searchDisplayValue.value = true;
    update();
  }
}
