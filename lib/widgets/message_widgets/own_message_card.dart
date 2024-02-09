import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.ownMessage});

  final String ownMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child:  Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(0))),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: ownMessageColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 12),
                child: Text(
                  ownMessage,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
