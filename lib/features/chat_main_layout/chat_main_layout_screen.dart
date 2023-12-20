// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nms_chat/features/chat_main_layout/chat_main_layout.dart';

// class ChatMainLayoutScreen extends StatelessWidget {
//   const ChatMainLayoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ChatMainLayOutController>(
//         init: ChatMainLayOutController(),
//         builder: (controller) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Chat App'),
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.search),
//                 ),
//                 PopupMenuButton(onSelected: (value) {
//                   debugPrint(value);
//                 }, itemBuilder: (BuildContext context) {
//                   return const [
//                     PopupMenuItem(
//                       value: 'New group',
//                       child: Text(
//                         'New group',
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'New broadcast',
//                       child: Text(
//                         'New broadcast',
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'Whatsapp web',
//                       child: Text(
//                         'Whatsapp web',
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'Starred message',
//                       child: Text(
//                         'Starred message',
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'Settings',
//                       child: Text(
//                         'Settings',
//                       ),
//                     ),
//                   ];
//                 })
//               ],
//               bottom: TabBar(
//                   controller: TabController(
//               length: 4,
//               vsync: AnimatedListState(),
//               initialIndex: controller.selectedIndex.value,
//             ),
//                   indicatorColor: Colors.white,
//                   tabs: const [
//                     Tab(
//                       icon: Icon(Icons.camera_alt),
//                     ),
//                     Tab(
//                       text: 'CHATS',
//                     ),
//                     Tab(
//                       text: 'STATUS',
//                     ),
//                     Tab(
//                       text: 'CALLS',
//                     ),
//                   ]),
//             ),
//             body: TabBarView(
//                 controller: TabController(
//               length: 4,
//               vsync: AnimatedListState(),
//               initialIndex: controller.selectedIndex.value,
//             ),
//                 children: const [
//                   // const CameraScreen(),
//                   // ChatScreen(
//                   //   chatModels: widget.chatModels,
//                   //   sourceChat: widget.sourceChat,
//                   // ),
//                   Text('Status'),
//                   Text('Calls'),
//                   Text('Status'),
//                   Text('Calls')
//                 ]),
//           );
//         });
//   }
// }
import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

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
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'NMS CHAT',
            style: TextStyle(color: backgroundColor),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
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
          bottom: TabBar(
              labelColor: backgroundColor,
              controller: _controller,
              indicatorColor: Colors.white,
              tabs: const [
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STATUS',
                ),
                Tab(
                  text: 'CALLS',
                ),
              ]),
        ),
        body: TabBarView(controller: _controller, children: const [
          // const CameraScreen(),
          // ChatScreen(
          //   chatModels: widget.chatModels,
          //   sourceChat: widget.sourceChat,
          // ),
          Text('Status'),
          Text('Calls'),
          Text('Status'),
          Text('Calls')
        ]),
      ),
    );
  }
}
