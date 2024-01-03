import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
              overlayColor: Colors.white,
              overlayOpacity: 0.4,
              spacing: 5,
              spaceBetweenChildren: 5,
              //openCloseDial: controller.isDialOpen,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 24,
              ),
              backgroundColor: primaryColor,
              children: [
                SpeedDialChild(
                    backgroundColor: primaryColor,
                    labelBackgroundColor: Colors.transparent,
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    child: const Icon(
                      Icons.group_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: 'New Group',
                    onTap: () {
                      debugPrint('tapped');
                    }),
                SpeedDialChild(
                    backgroundColor: primaryColor,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    labelBackgroundColor: Colors.transparent,
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    label: 'New Chat'),
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
                  return Slidable(
                    startActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.onDissmissed();
                        },
                        backgroundColor: Colors.green,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                       SlidableAction(
                        onPressed: (context) {
                          controller.onDissmissed();
                        },
                        backgroundColor: Colors.blue,
                        icon: Icons.archive,
                        label: 'archive',
                      ),
                      
                    ]),

                    endActionPane:ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.onDissmissed();
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      
                      
                    ]) ,

                    child: const CustomCard(
                        // chatModel: widget.chatModels[index],
                        // sourceChat: widget.sourceChat,
                        ),
                  );
                }),
          );
          // );
        });
  }
}


