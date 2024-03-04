import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class ReplyMessageCard extends StatelessWidget {
  const ReplyMessageCard({super.key, required this.replyMessage, this.onLongPress, required this.replyMessageTime});

  final String replyMessage;
  final VoidCallback? onLongPress;
  final String replyMessageTime;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onLongPress: onLongPress,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: replyMessageColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 12),
                  child: Text(
                    replyMessage,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: secondaryColor),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    replyMessageTime,
                    style:const TextStyle(color: iconColor, fontSize: 12),
                  ),
                  const Icon(
                    Icons.done,
                    color: iconColor,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
