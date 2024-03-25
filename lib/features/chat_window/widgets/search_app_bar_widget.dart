import 'package:flutter/material.dart';

import '../../../widgets/search_text_field.dart';
import '../chat_window.dart';

AppBar searhAppBarWidget(ChatWindowController controller) {
  return AppBar(
    toolbarHeight: 64,
    surfaceTintColor: Colors.white,
    backgroundColor: const Color(0xffFAFAFA),
    leading: Container(),
    actions: [
      Expanded(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 22, right: 23.8, bottom: 4),
          child: SearchTextField(
            onSubmitted: (value) async {},
            controller: controller.searchController,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: InkWell(
          onTap: () {
            controller.searchDisplay();
          },
          child: const Icon(
            Icons.close,
            size: 24,
          ),
        ),
      ),
    ],
  );
}
