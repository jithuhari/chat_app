import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class ReplyMessageCard extends StatelessWidget {
  const ReplyMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: const Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: replyMessageColor,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 12),
                child: Text(
                  'Hey how are u , Its me your old friend Hey how are u , Its me your old friend',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
