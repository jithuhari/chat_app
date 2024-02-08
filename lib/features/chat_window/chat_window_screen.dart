import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/chat_window/chat_window.dart';
import 'package:nms_chat/widgets/message_widgets/own_message_card.dart';

import '../../utils/utils.dart';
import '../../widgets/message_widgets/reply_message_card.dart';

class ChatWindowScreen extends StatelessWidget {
  const ChatWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String firstName = arguments['firstName'];
    final String lastName = arguments['lastName'];
    return GetBuilder<ChatWindowController>(
        init: ChatWindowController(),
        builder: (controller) {
          // if (controller.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          // if (controller.newChatListModelData.isEmpty) {
          //   return const Center(
          //     child: Text('No data available'),
          //   );
          // }
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
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
                        backgroundImage: AssetImage('assets/png/person.jpg')),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                        onTap: () {
                          debugPrint('Search');
                          // controller.searchDisplay();
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
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 185,
                      child: ListView(
                        children: const [
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                          OwnMessageCard(),
                          ReplyMessageCard(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: cardColor,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Image.asset('assets/png/Plus.png'),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 140,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 13),
                                  child: Container(
                                      height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(8)),
                                      child: TextFormField(
                                        controller:
                                            controller.msgTextController,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller
                                                .changeSendButtonStatusToTrue();
                                          } else {
                                            controller
                                                .changeSendButtonStatusTofalse();
                                          }
                                        },
                                        keyboardType: TextInputType.multiline,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        maxLines: 5,
                                        minLines: 1,
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffF1F1F1))),
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          hintText: 'Type a message...',
                                          hintStyle: TextStyle(
                                              color: hintColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          contentPadding: EdgeInsets.all(5),
                                        ),
                                      )),
                                )),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: InkWell(
                                    onTap: () {
                                      if (controller.isSendButton == true) {
                                        controller.sendMessage(
                                            controller.msgTextController.text,
                                            1,
                                            8,
                                            1);
                                            controller.msgTextController.clear();
                                      }
                                    },
                                    child: Image.asset(
                                        controller.isSendButton == false
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
}
