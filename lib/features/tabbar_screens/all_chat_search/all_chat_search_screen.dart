import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/tabbar_screens/all_chat_search/all_chat_search.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_card.dart';

class AllChatSearchScreen extends StatelessWidget {
  const AllChatSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllChatSearchController>(
        init: AllChatSearchController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: SpeedDial(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              buttonSize: const Size(48, 48),
              icon: Icons.add,
              activeIcon: Icons.close,
              childrenButtonSize: const Size(48, 58),
              overlayColor: Colors.black,
              overlayOpacity: 0.8,
              spacing: 5,
              spaceBetweenChildren: 5,
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
                    child: const Icon(
                      Icons.group_outlined,
                      color: primaryColor,
                      size: 24,
                    ),
                    label: 'New Group',
                    onTap: () {
                      debugPrint('tapped');
                    }),
                SpeedDialChild(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.chat_bubble_outline,
                      color: primaryColor,
                      size: 24,
                    ),
                    labelBackgroundColor: Colors.transparent,
                    labelShadow: [],
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    label: 'New Chat'),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text('Contacts'),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: controller.chatListModelData.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
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
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
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
                            name: controller.chatListModelData[index].firstName,
                            message:
                                controller.chatListModelData[index].message,
                            lastMessageTime:
                                controller.formattedLastMessageTime[index],
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Messages'),
                  ),
                ),
              ],
            ),
          );
          // );
        });
  }
}
