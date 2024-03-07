import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/profile_page/profile_page.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(
        init: ProfilePageController(),
        builder: (controller) {
          // if (controller.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.white,
                title: SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: const Center(child: Text('Profile'))),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const Center(
                        child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage:
                                AssetImage('assets/png/person.jpg')),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${controller.firstName} ${controller.lastName}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Mobile',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: hintColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            controller.phNumber,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Mail',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: hintColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            controller.email,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Documents',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: hintColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: hintColor,
                          )
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return const Image(
                              image: AssetImage("assets/png/docs.png"));

                          // Card(
                          //   color: Colors.red[100],
                          // );
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Other Files',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: hintColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/starred_message_screen');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                    image: AssetImage(
                                        "assets/png/starred_message.png")),
                                SizedBox(
                                  width: 16,
                                ),
                                Text('Starred Messages',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: iconColor)),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                              color: hintColor,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/png/document.png")),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Docs',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: iconColor),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: hintColor,
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),

                      // const SizedBox(
                      //   height: 24,
                      // ),
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Image(image: AssetImage("assets/png/link.png")),
                      //         SizedBox(
                      //           width: 16,
                      //         ),
                      //         Text('Links',
                      //             style: TextStyle(
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: iconColor)),
                      //       ],
                      //     ),
                      //     Icon(
                      //       Icons.arrow_forward_ios_rounded,
                      //       size: 10,
                      //       color: hintColor,
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/png/groups_2.png")),
                              SizedBox(
                                width: 16,
                              ),
                              Text('Groups',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: iconColor)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: hintColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(image: AssetImage("assets/png/task.png")),
                              SizedBox(
                                width: 16,
                              ),
                              Text('Tasks',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: iconColor)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: hintColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
