import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/new_chat_card.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
           surfaceTintColor: Colors.white,
          backgroundColor: cardColor,
          iconTheme: const IconThemeData(
            color: iconColor,
          ),
          title: const Text(
            'New Chat',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (builder, index) {
              return const NewChatCard(
                name: 'Robert Fox',
              );
            }),
      ),
    );
  }
}
