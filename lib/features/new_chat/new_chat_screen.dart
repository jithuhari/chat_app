import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/new_chat/new_chat.dart';

import '../../utils/utils.dart';
import '../../widgets/new_chat_card.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewChatSearchController>(
        init: NewChatSearchController(),
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
            )
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
    );});
  }
}
