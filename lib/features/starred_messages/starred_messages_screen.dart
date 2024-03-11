import 'package:flutter/material.dart';
import '../../utils/theme/theme_constants.dart';

class StarredMessagesScreen extends StatelessWidget {
  const StarredMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: SizedBox(
              width: MediaQuery.of(context).size.width - 140,
              child: const Center(child: Text('Starred Messages'))),
        ),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: const [
            StarredMessageWidget(
              senderName: 'Esther Howard',
              senderImage: 'assets/png/person.jpg',
              receiverName: 'You',
              message: 'Hi',
              cardColor: replyMessageColor,
            ),
            SizedBox(height: 18.0),
            StarredMessageWidget(
                senderName: 'You',
                senderImage: 'assets/png/person.jpg',
                receiverName: 'Esther Howard',
                message:
                    'Hello Esther! Whats the update on the new project you were assigned with? Hope everything is okay☺️👍🏻',
                cardColor: ownMessageColor),
            SizedBox(height: 18.0),
            StarredMessageWidget(
                senderName: 'Esther Howard',
                senderImage: 'assets/png/person.jpg',
                receiverName: 'You',
                message:
                    'Ryan, Issue #3452 has been fixed and the change is rectified on the design, pls check😌 ',
                cardColor: replyMessageColor),
            SizedBox(height: 18.0),
            StarredMessageWidget(
              senderName: 'Esther Howard',
              senderImage: 'assets/png/person.jpg',
              receiverName: 'You',
              message: 'Can you check this ?',
              cardColor: ownMessageColor,
            ),
          ],
        ),
      ),
    );
  }
}

class StarredMessageWidget extends StatelessWidget {
  final String senderName;
  final String senderImage;
  final String receiverName;
  final String message;
  final Color cardColor;

  const StarredMessageWidget(
      {super.key,
      required this.senderName,
      required this.senderImage,
      required this.receiverName,
      required this.message,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(senderImage),
              radius: 20.0,
            ),
            const SizedBox(width: 12.0),
            Text(
              senderName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),
            ),
            const SizedBox(width: 8.0),
            Image.asset('assets/png/arrow.png'),
            // const Text(
            //   '>',
            //   style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       color: secondaryColor),
            // ),
            const SizedBox(width: 8.0),
            Text(
              receiverName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 12),
            child: Text(
              message,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '11:09 AM  11/12/2023',
                style: TextStyle(color: iconColor, fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}
