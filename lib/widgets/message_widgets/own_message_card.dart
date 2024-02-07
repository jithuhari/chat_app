import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
      child: Card(
        color: ownMessageColor,
      ),
    );
  }
}
