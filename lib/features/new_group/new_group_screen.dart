import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/new_group/new_group.dart';

import '../../utils/utils.dart';
import '../../widgets/cornered_button.dart';
import '../../widgets/new_group_selection_card.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewGroupController>(
        init: NewGroupController(),
        builder: (controller) {
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
                      'New group',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ))),
                // const Text(
                //   'New Group',
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 17),
                      child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage('assets/png/person.jpg'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Name Your Group'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffB7B7B7), width: 1.0),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 1.05,
                      child: ListView.builder(
                          itemCount: controller.firstName.length,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (builder, index) {
                            return NewgroupSelectionCard(
                              name:
                                  "${controller.firstName[index]} ${controller.lastName[index]}",
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 12),
                      child: CorneredButton(
                        title: 'Create group',
                        onPress: () async {
                          await controller.createGroup();
                        },
                        color: primaryColor,
                        textcolor: Colors.white,
                        height: 50,
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
