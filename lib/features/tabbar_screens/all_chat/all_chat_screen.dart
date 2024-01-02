import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_card.dart';
import 'all_chat.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllChatController>(
        init: AllChatController(),
        builder: (controller) {
          return

              //  PopScope(
              //   onPopInvoked: (didPop)async{
              //     // close Speed dial
              //     if(controller.isDialOpen.value){
              //       controller.isDialOpen.value=false;
              //       return ;
              //       }
              //       else{
              //         return;
              //       }
              //   },
              //   child:

              Scaffold(
            backgroundColor: Colors.white,

            floatingActionButton: SpeedDial(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              buttonSize: const Size(48, 48),
              //animatedIcon: AnimatedIcons.add_event,
              icon: Icons.add,
              overlayColor: Colors.black,
              overlayOpacity: 0.4,
              spacing: 5,
              spaceBetweenChildren: 5,
              //openCloseDial: controller.isDialOpen,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 36,
              ),
              backgroundColor: primaryColor,
              children: [
                SpeedDialChild(
                    child: const Icon(Icons.mail),
                    onTap: () {
                      debugPrint('tapped');
                    }),
                SpeedDialChild(
                  child: const Icon(Icons.call),
                ),
                SpeedDialChild(
                  child: const Icon(Icons.copy),
                ),
              ],
            ),

            // FloatingActionButton(
            //   backgroundColor: primaryColor,
            //     child: const Icon(Icons.add,size: 36,color: Colors.white,),
            //     onPressed: () {
            //       // Navigator.push(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //         builder: (builder) => const SelectContactScreen()));
            //     }),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomCard(
                      // chatModel: widget.chatModels[index],
                      // sourceChat: widget.sourceChat,
                      );
                }),
          );
          // );
        });
  }
}
