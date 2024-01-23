import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/new_group_selection_card.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

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
            'New Group',
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
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: primaryColor, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffB7B7B7), width: 1.0),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 1.05,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (builder, index) {
                      return const NewgroupSelectionCard(
                        name: 'Cody Fisher',
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
