import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/chat_window/chat_window.dart';
import 'package:nms_chat/widgets/message_widgets/own_message_card.dart';
import 'package:nms_chat/widgets/message_widgets/reply_message_card.dart';

import '../../utils/utils.dart';
import '../../widgets/search_text_field.dart';

class ChatWindowScreen extends StatelessWidget {
  const ChatWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatWindowController>(
        init: ChatWindowController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: controller.searchDisplayValue == false
                  ? AppBar(
                      toolbarHeight: 64,
                      surfaceTintColor: Colors.white,
                      backgroundColor: cardColor,
                      iconTheme: const IconThemeData(
                        color: iconColor,
                      ),
                      leadingWidth: 70,
                      leading: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 24,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blueGrey,
                              backgroundImage:
                                  AssetImage('assets/png/person.jpg')),
                        ],
                      ),
                      title: InkWell(
                        onTap: () {
                          Get.toNamed('/profile_page_screen');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.firstName} ${controller.lastName}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Last seen 2 mins ago',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: iconColor),
                            )
                          ],
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: InkWell(
                              onTap: () {
                                debugPrint('Search');
                                controller.searchDisplay();
                              },
                              child: Image.asset("assets/png/search1.png")),
                        ),
                        PopupMenuButton(
                            iconColor: iconColor,
                            iconSize: 24,
                            onSelected: (value) {
                              debugPrint(value);
                            },
                            itemBuilder: (BuildContext context) {
                              return const [
                                PopupMenuItem(
                                  value: 'New group',
                                  child: Text(
                                    'New group',
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'New broadcast',
                                  child: Text(
                                    'New broadcast',
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'Whatsapp web',
                                  child: Text(
                                    'Whatsapp web',
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'Starred message',
                                  child: Text(
                                    'Starred message',
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'Settings',
                                  child: Text(
                                    'Settings',
                                  ),
                                ),
                              ];
                            })
                      ],
                    )
                  : AppBar(
                      toolbarHeight: 64,
                      surfaceTintColor: Colors.white,
                      backgroundColor: const Color(0xffFAFAFA),
                      leading: Container(),
                      actions: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 22, right: 23.8, bottom: 4),
                            child: SearchTextField(
                              onSubmitted: (value) async {},
                              controller: controller.searchController,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: InkWell(
                            onTap: () {
                              controller.searchDisplay();
                            },
                            child: const Icon(
                              Icons.close,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * .73,
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: controller.isInitialMessageshow == true
                                ? controller.initialOldMessages.length
                                : controller.historicalMessages.length,
                            itemBuilder: (context, index) {
                              if (controller.isInitialMessageshow == true
                                  ? controller
                                          .reversedOldMessageSenderId[index] ==
                                      88
                                  : controller.reversedHistoricalMessageSenderId[
                                          index] ==
                                      88) {
                                return controller.isInitialMessageshow == true
                                    ? Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: messageColor,
                                                  ),
                                                  value: controller
                                                      .selectedIndexes
                                                      .contains(
                                                          index), // Check if index is in the selectedIndexes list
                                                  onChanged: (value) {
                                                    controller.toggleSelection(
                                                        index); // Toggle the selection when checkbox is clicked
                                                  },
                                                )
                                              : Container(),
                                          Expanded(
                                            child: OwnMessageCard(
                                                onLongPress: () {
                                                  messageBottomSheet(
                                                      context,
                                                      controller
                                                              .reversedOldMessages[
                                                          index],
                                                      controller);
                                                },
                                                ownMessage: controller
                                                        .reversedOldMessages[
                                                    index]),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: messageColor,
                                                  ),
                                                  value: controller
                                                      .selectedIndexes
                                                      .contains(
                                                          index), // Check if index is in the selectedIndexes list
                                                  onChanged: (value) {
                                                    controller.toggleSelection(
                                                        index); // Toggle the selection when checkbox is clicked
                                                  },
                                                )
                                              : Container(),
                                          Expanded(
                                            child: OwnMessageCard(
                                                onLongPress: () {
                                                  messageBottomSheet(
                                                      context,
                                                      controller
                                                              .reversedMessages[
                                                          index],
                                                      controller);
                                                },
                                                ownMessage: controller
                                                    .reversedMessages[index]),
                                          ),
                                        ],
                                      );
                              } else {
                                return controller.isInitialMessageshow == true
                                    ? Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: messageColor,
                                                  ),
                                                  value: controller
                                                      .selectedIndexes
                                                      .contains(
                                                          index), // Check if index is in the selectedIndexes list
                                                  onChanged: (value) {
                                                    controller.toggleSelection(
                                                        index); // Toggle the selection when checkbox is clicked
                                                  },
                                                )
                                              : Container(),
                                          Expanded(
                                            child: ReplyMessageCard(
                                              onLongPress: () {
                                                messageBottomSheet(
                                                    context,
                                                    controller
                                                            .reversedOldMessages[
                                                        index],
                                                    controller);
                                              },
                                              replyMessage: controller
                                                  .reversedOldMessages[index],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: messageColor,
                                                  ),
                                                  value: controller
                                                      .selectedIndexes
                                                      .contains(
                                                          index), // Check if index is in the selectedIndexes list
                                                  onChanged: (value) {
                                                    controller.toggleSelection(
                                                        index); // Toggle the selection when checkbox is clicked
                                                  },
                                                )
                                              : Container(),
                                          Expanded(
                                            child: ReplyMessageCard(
                                              onLongPress: () {
                                                messageBottomSheet(
                                                    context,
                                                    controller.reversedMessages[
                                                        index],
                                                    controller);
                                              },
                                              replyMessage: controller
                                                  .reversedMessages[index],
                                            ),
                                          ),
                                        ],
                                      );
                              }
                            })),
                    controller.searchDisplayValue == true
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 65,
                              color: cardColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: InkWell(
                                          onTap: () {
                                            if (controller.isSendButton ==
                                                true) {
                                              FocusScope.of(context).unfocus();
                                              controller
                                                  .isInitialMessageshowfalse();
                                              controller.sendMessage(
                                                  controller
                                                      .msgTextController.text,
                                                  88,
                                                  controller.receiverId,
                                                  1);
                                              controller.msgTextController
                                                  .clear();
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/png/arrow_up.png'))),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: InkWell(
                                          onTap: () {
                                            if (controller.isSendButton ==
                                                true) {
                                              FocusScope.of(context).unfocus();
                                              controller
                                                  .isInitialMessageshowfalse();
                                              controller.sendMessage(
                                                  controller
                                                      .msgTextController.text,
                                                  88,
                                                  controller.receiverId,
                                                  1);
                                              controller.msgTextController
                                                  .clear();
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/png/arrow_down.png'))),
                                ],
                              ),
                            ),
                          )
                        : controller.isForwardActive == true
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 65,
                                  color: cardColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: InkWell(
                                                onTap: () {
                                                  controller.selectedIndexes
                                                      .clear();
                                                  controller
                                                      .clearSelectedCOunt();
                                                  controller
                                                      .forwardActionActive();
                                                },
                                                child: Image.asset(
                                                    'assets/png/Cancel.png')),
                                          ),
                                          Text(
                                            '${controller.selectedCount} Selected',
                                            style: const TextStyle(
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: InkWell(
                                              onTap: () {
                                                if (controller.isSendButton ==
                                                    true) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  controller
                                                      .isInitialMessageshowfalse();
                                                  controller.sendMessage(
                                                      controller
                                                          .msgTextController
                                                          .text,
                                                      88,
                                                      controller.receiverId,
                                                      1);
                                                  controller.msgTextController
                                                      .clear();
                                                }
                                              },
                                              child: Image.asset(
                                                  'assets/png/forward.png'))),
                                    ],
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: cardColor,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child:
                                            Image.asset('assets/png/Plus.png'),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              140,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13),
                                            child: Container(
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.white,
                                                ),
                                                child: TextFormField(
                                                  // focusNode: controller.focusNode,
                                                  controller: controller
                                                      .msgTextController,
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .changeSendButtonStatusToTrue();
                                                    } else {
                                                      controller
                                                          .changeSendButtonStatusTofalse();
                                                    }
                                                  },
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  maxLines: 5,
                                                  minLines: 1,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(
                                                                    0xffF1F1F1))),
                                                    fillColor: Colors.white,
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Type a message...',
                                                    hintStyle: TextStyle(
                                                        color: hintColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    contentPadding:
                                                        EdgeInsets.all(5),
                                                  ),
                                                )),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: InkWell(
                                              onTap: () {
                                                if (controller.isSendButton ==
                                                    true) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  controller
                                                      .isInitialMessageshowfalse();
                                                  controller.sendMessage(
                                                      controller
                                                          .msgTextController
                                                          .text,
                                                      88,
                                                      controller.receiverId,
                                                      1);
                                                  controller.msgTextController
                                                      .clear();
                                                }
                                              },
                                              child: Image.asset(controller
                                                          .isSendButton ==
                                                      false
                                                  ? 'assets/png/microphone.png'
                                                  : 'assets/png/send.png'))),
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> messageBottomSheet(BuildContext context,
      String messageContent, ChatWindowController controller) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      height: 3,
                      width: 75,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/love.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/laugh.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/sad.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/thumps_up.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/add_reactions.png')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: messageContent));
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/copy.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Copy',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/png/message_bottom_sheet/pin.png'),
                        const SizedBox(
                          width: 32,
                        ),
                        const Text(
                          'Pin Message',
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/png/message_bottom_sheet/star.png'),
                        const SizedBox(
                          width: 32,
                        ),
                        const Text(
                          'Star Message',
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                            'assets/png/message_bottom_sheet/reply.png'),
                        const SizedBox(
                          width: 32,
                        ),
                        const Text(
                          'Reply',
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.forwardActionActive();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/forward.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Forward',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
