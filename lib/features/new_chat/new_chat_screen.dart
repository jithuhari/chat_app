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
                title: SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: const Center(
                        child: Text(
                      'New Chat',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ))),
                // const Text(
                //   'New Chat',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                // ),
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
                  itemCount: controller.newChatListModelData.length,
                  itemBuilder: (builder, index) {
                    return NewChatCard(
                      name: '${controller.newChatListModelData[index].firstName} ${controller.newChatListModelData[index].lastName}',
                    );
                  }),
            ),
          );
        });
  }
}
