import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme/theme.dart';
import '../chat_window.dart';

AppBar mainAppBar(ChatWindowController controller, BuildContext context) {
  return AppBar(
    bottom: controller.isPinMessageActive == true
        ? PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height / .9),
            child: Column(
              children: [
                const Divider(
                  thickness: .4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image.asset('assets/png/push_pin.png'),
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Ryan Lewis',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: secondaryColor),
                                  ),
                                  Text(controller.message,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: secondaryColor))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(controller
                          .convertToIndianTime(controller.timeOfMessage))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1.5,
                      color: const Color.fromARGB(255, 245, 245, 245),
                    ),
                  ],
                )
              ],
            ),
          )
        : PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height / 10),
            child: Container(),
          ),
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
    title: InkWell(
      onTap: () {
        Get.toNamed('/profile_page_screen');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${controller.firstName} ${controller.lastName}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            controller.convertToIndianTime(controller.lastSeen),
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: iconColor),
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
  );
}
