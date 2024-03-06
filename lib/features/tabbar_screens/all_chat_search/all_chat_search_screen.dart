import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/tabbar_screens/all_chat_search/all_chat_search.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_message_card.dart';
import '../../../widgets/other_contacts_card.dart';

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

          if (controller.chatListModelData.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: controller.isSearchActive == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isContactAvailable == true
                            ? const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text('Contacts'),
                              )
                            : Container(),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.contactsData!.data.length,
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
                                  unReadMessageCount: controller.chatListModelData[index].unReadMessageCount,
                                  onTap: () {},
                                  name: controller
                                      .contactsData!.data[index].userName,
                                  message: controller
                                      .contactsData!.data[index].message
                                      .toString(),
                                  lastMessageTime: controller.contactsData!
                                      .data[index].lastMessageTime,
                                ),
                              );
                            }),
                        controller.isContactAvailable == true
                            ? seeMore(controller)
                            : Container(),
                        controller.isNmsContactAvailable == true
                            ? const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text('Other Contacts'),
                              )
                            : Container(),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.nmsContactsData!.data.length,
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
                                child: OtherContactsCard(
                                  name: controller.nmsContactsData!.data[index]
                                      .personalDetails.firstname,
                                ),
                              );
                            }),
                        controller.isContactAvailable == true
                            ? seeMore(controller)
                            : Container(),
                        controller.isMessageAvailable == true
                            ? const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text('Messages'),
                              )
                            : Container(),
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
                                  name: controller
                                      .messageData!.data[index].userName,
                                  message: controller
                                      .messageData!.data[index].message
                                      .toString(),
                                  lastMessageTime: controller
                                      .messageData!.data[index].lastMessageTime,
                                ),
                              );
                            }),
                        controller.isMessageAvailable == true
                            ? seeMore(controller)
                            : Container(),
                        controller.isLinkAvailable == true
                            ? const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text('Links'),
                              )
                            : Container(),
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
                                  name: controller
                                      .linksData!.data[index].userName,
                                  message: controller
                                      .linksData!.data[index].links
                                      .toString(),
                                  lastMessageTime: controller
                                      .linksData!.data[index].lastMessageTime,
                                ),
                              );
                            }),
                        controller.isLinkAvailable == true
                            ? seeMore(controller)
                            : Container(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Contacts'),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
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
                                  onTap: () {},
                                  // name: 'Cody Fisher',
                                  unReadMessageCount: controller.chatListModelData[index].unReadMessageCount,
                                  name: controller
                                      .chatListModelData[index].firstName,
                                  message: controller
                                      .chatListModelData[index].message,
                                  lastMessageTime: controller
                                      .formattedLastMessageTime[index],
                                  // chatModel: widget.chatModels[index],
                                  // sourceChat: widget.sourceChat,
                                ),
                              );
                            }),
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
        controller.onSeeMorePaginationActive();
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
