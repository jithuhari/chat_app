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
                  borderRadius: BorderRadius.circular(7)),
              buttonSize: const Size(48, 48),
              //animatedIcon: AnimatedIcons.add_event,
              icon: Icons.add,
              childPadding: const EdgeInsets.only(right: 5, left: 5),
              activeIcon: Icons.close,
              childrenButtonSize: const Size(48, 38),
              overlayColor: Colors.black,
              overlayOpacity: 0.8,
              spacing: 5,
              spaceBetweenChildren: 8,
              //openCloseDial: controller.isDialOpen,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 24,
              ),
              backgroundColor: primaryColor,
              children: [
                SpeedDialChild(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    backgroundColor: Colors.white,
                    labelBackgroundColor: Colors.transparent,
                    labelShadow: [],
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    child: Image.asset("assets/png/groups.png"),
                    label: 'New Group',
                    onTap: () {
                      debugPrint('tapped');
                    }),
                SpeedDialChild(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/png/chat.png"),
                    labelBackgroundColor: Colors.transparent,
                    labelShadow: [],
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                itemCount: controller.chatListModelData.length,
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
                    endActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.onDissmissed();
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ]),
                    child: CustomCard(
                      // name: 'Cody Fisher',
                      name: controller.chatListModelData[index].userName,
                      message: controller.chatListModelData[index].message,
                      lastMessageTime:
                          controller.formattedLastMessageTime[index],
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
