import 'package:flutter/material.dart';

class NewChatCard extends StatelessWidget {
  const NewChatCard({
    super.key,
    required this.name,
  });

  // final ChatModel chatModel;
  // final ChatModel sourceChat;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
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
                          color: Colors.black),
                    ),
                    // Text(
                    //   lastMessageTime,
                    //   style: const TextStyle(
                    //       fontSize: 12,
                    //       color: iconColor,
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
                // subtitle: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         message,
                //         style: const TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400,
                //             color: messageColor),
                //         maxLines: 1,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),

                //   ],
                // ),
                // trailing: Text('4.00 pm',style: TextStyle(fontSize: 12),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
