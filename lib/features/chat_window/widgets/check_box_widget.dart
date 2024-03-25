import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';
import '../chat_window.dart';

Checkbox chekBoxWidget(ChatWindowController controller, int index) {
  return Checkbox(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    activeColor: primaryColor,
    side: const BorderSide(
      width: 1,
      color: messageColor,
    ),
    value: controller.selectedIndexes
        .contains(index), // Check if index is in the selectedIndexes list
    onChanged: (value) {
      controller.toggleSelection(
          index); // Toggle the selection when checkbox is clicked
    },
  );
}
