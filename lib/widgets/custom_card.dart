import 'package:flutter/material.dart';
import 'package:nms_chat/utils/utils.dart';
// import 'package:whatts_app/model/chat_model/chat_model.dart';
// import 'package:whatts_app/screens/individual_screen/individual_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  // final ChatModel chatModel;
  // final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => IndividualPage(
        //               chatModel: chatModel, sourceChat: sourceChat,
        //             )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
              color: cardColor, borderRadius: BorderRadius.circular(10)),
          child: const Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('assets/png/person.jpg')),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cody Fisher',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                   Text('4.00 pm',style: TextStyle(fontSize: 12,color:messageColor ),),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Ut enim ad minim veniam, quis nost',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: messageColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.done_all,
                      color: messageColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: primaryColor,
                      child: Text('38',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
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
