import 'package:flutter/material.dart';
import 'package:nms_chat/utils/theme/theme.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      backgroundImage: AssetImage('assets/png/person.jpg')),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Coder White',
                  style: TextStyle(
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
                const Row(
                  children: [
                    Text(
                      '+91 7876345178',
                      style: TextStyle(
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
                const Row(
                  children: [
                    Text(
                      'coder@gmail.com',
                      style: TextStyle(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage("assets/png/video.png")),
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
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage("assets/png/document.png")),
                        SizedBox(
                          width: 16,
                        ),
                        Text('Videos',
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
  }
}
