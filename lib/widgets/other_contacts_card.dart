import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';
// import 'package:whatts_app/model/chat_model/chat_model.dart';
// import 'package:whatts_app/screens/individual_screen/individual_screen.dart';

class OtherContactsCard extends StatelessWidget {
  const OtherContactsCard(
      {super.key,
      required this.name,
     });

  // final ChatModel chatModel;
  // final ChatModel sourceChat;
  final String name;
  
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
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('assets/png/person.jpg')),
                    trailing: Container(
                      padding: const EdgeInsets.only(top:3,bottom: 3,left: 10,right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: primaryColor,)
                      ),
                      child: const Text('Invite',style: TextStyle(color: primaryColor),)),
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
