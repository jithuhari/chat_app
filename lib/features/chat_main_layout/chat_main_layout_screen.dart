import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/utils/theme/theme.dart';

import '../../widgets/search_text_field.dart';
import '../tabbar_screens/all_chat/all_chat.dart';
import 'chat_main_layout.dart';

class ChatMainLayoutScreen extends StatefulWidget {
  const ChatMainLayoutScreen({
    super.key,
    // required this.chatModels, required this.sourceChat
  });
  // final List<ChatModel> chatModels;
  // final ChatModel sourceChat;

  @override
  State<ChatMainLayoutScreen> createState() => _ChatMainLayoutScreenState();
}

class _ChatMainLayoutScreenState extends State<ChatMainLayoutScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatMainLayOutController>(
        init: ChatMainLayOutController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.white,
                title: const Text(
                  'NMS CHAT',
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  PopupMenuButton(onSelected: (value) {
                    debugPrint(value);
                  }, itemBuilder: (BuildContext context) {
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

              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:22,right: 23.8,bottom: 10),
                          child: SearchTextField(
                            controller: controller.chatSearchController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:21),
                        child: IconButton(
                          iconSize: 24,
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 21),
                    child: Container(
                      height: 33,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                      ),
                      child: TabBar(
                        controller: _controller,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          color: primaryColor,
                        ),
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: const Color(0xff7A7A7A),
                        tabs: const [
                          Tab(
                            text: 'All Chats',
                          ),
                          Tab(
                            text: 'Groups',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _controller,
                        children: const [
                          // const CameraScreen(),
                          // ChatScreen(
                          //   chatModels: widget.chatModels,
                          //   sourceChat: widget.sourceChat,
                          // ),
                          AllChatScreen(),
                          Center(child: Text('Groups')),
                        ]),
                  ),
                ],
              ),
              // body:

              // TabBarView(controller: _controller, children: const [
              //   // const CameraScreen(),
              //   // ChatScreen(
              //   //   chatModels: widget.chatModels,
              //   //   sourceChat: widget.sourceChat,
              //   // ),
              //   AllChatScreen(),
              //   Center(child: Text('Groups')),

              // ]
              // ),
            ),
          );
        });
  }
}
