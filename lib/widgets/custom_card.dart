import 'package:flutter/material.dart';
import 'package:nms_chat/utils/utils.dart';
// import 'package:whatts_app/model/chat_model/chat_model.dart';
// import 'package:whatts_app/screens/individual_screen/individual_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.name,
      required this.message,
      required this.lastMessageTime,
      required this.onTap, required this.unReadMessageCount});

  // final ChatModel chatModel;
  // final ChatModel sourceChat;
  final String name;
  final String message;
  final String unReadMessageCount;
  final String lastMessageTime;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      //  () {
      //   // Navigator.push(
      //   //     context,
      //   //     MaterialPageRoute(
      //   //         builder: (context) => IndividualPage(
      //   //               chatModel: chatModel, sourceChat: sourceChat,
      //   //             )));
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('assets/png/person.jpg')),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      lastMessageTime,
                      style: const TextStyle(
                          fontSize: 12,
                          color: iconColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: messageColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.done_all,
                      color: messageColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                     CircleAvatar(
                      radius: 12,
                      backgroundColor: primaryColor,
                      child: Text(
                        unReadMessageCount,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                // trailing: Text('4.00 pm',style: TextStyle(fontSize: 12),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
