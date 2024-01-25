import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/tabbar_screens/all_chat_search/all_chat_search.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_message_card.dart';

class AllChatSearchScreen extends StatelessWidget {
  const AllChatSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllChatSearchController>(
        init: AllChatSearchController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.messageData == null) {
            return const Center(
              child: Text('No data available'),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Contacts'),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.messageData!.data.length,
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
                            name: controller.messageData!.data[index].userName,
                            message: controller.messageData!.data[index].message
                                .toString(),
                            lastMessageTime: controller
                                .messageData!.data[index].lastMessageTime,
                          ),
                        );
                      }),
                  seeMore(controller),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Nms Contacts'),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.messageData!.data.length,
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
                            name: controller.messageData!.data[index].userName,
                            message: controller.messageData!.data[index].message
                                .toString(),
                            lastMessageTime: controller
                                .messageData!.data[index].lastMessageTime,
                          ),
                        );
                      }),
                  seeMore(controller),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Messages'),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.messageData!.data.length,
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
                          child: CustomMessageCard(
                            name: controller.messageData!.data[index].userName,
                            message: controller.messageData!.data[index].message
                                .toString(),
                            lastMessageTime: controller
                                .messageData!.data[index].lastMessageTime,
                          ),
                        );
                      }),
                  seeMore(controller),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Links'),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.linksData!.data.length,
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
                          child: CustomMessageCard(
                            name: controller.linksData!.data[index].userName,
                            message: controller.linksData!.data[index].links
                                .toString(),
                            lastMessageTime: controller
                                .linksData!.data[index].lastMessageTime,
                          ),
                        );
                      }),
                  seeMore(controller),
                ],
              ),
            ),
          );
          // );
        });
  }

  GestureDetector seeMore(AllChatSearchController controller) {
    return GestureDetector(
      onTap: () {
        controller.onSeeMoreActive();
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              // showAllCards ? 'Show Less' :
              'See More',
              style: TextStyle(
                  color: iconColor, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
