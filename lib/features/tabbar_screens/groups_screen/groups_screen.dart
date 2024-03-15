import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_card.dart';
import 'groups_controller.dart';

class AllGroupScreen extends StatelessWidget {
  const AllGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllGroupController>(
        init: AllGroupController(),
        builder: (controller) {
          return Scaffold(
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
                      Get.toNamed('new_group_screen');
                    }),
                SpeedDialChild(
                    onTap: () {
                      Get.toNamed('/new_chat_screen');
                    },
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
            body: ListView.builder(
                itemCount: controller.fetchGroupsDetails.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          // controller.onDissmissed();
                        },
                        backgroundColor: Colors.green,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          // controller.onDissmissed();
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
                          // controller.onDissmissed();
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ]),
                    child: InkWell(
                      child: CustomCard(
                        unReadMessageCount: '10',
                        onTap: () {
                          // Get.toNamed('/chat_window_screen', arguments: {
                          //   'firstName':
                          //       controller.chatListModelData[index].firstName,
                          //   'lastName':
                          //       controller.chatListModelData[index].lastName,
                          //   'receiverId':
                          //       controller.chatListModelData[index].userId
                          // });
                        },
                        // name: 'Cody Fisher',
                        name:
                            controller.fetchGroupsDetails[index].groupName,
                        message: controller.fetchGroupsDetails[index].lastMessage==null?'':controller.fetchGroupsDetails[index].lastMessage!,
                        lastMessageTime:
                            '10 am',
                        // chatModel: widget.chatModels[index],
                        // sourceChat: widget.sourceChat,
                      ),
                    ),
                  );
                }),
          );
          // );
        });
  }
}
