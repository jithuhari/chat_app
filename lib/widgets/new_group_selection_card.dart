import 'package:flutter/material.dart';

class NewgroupSelectionCard extends StatelessWidget {
  const NewgroupSelectionCard({
    super.key,
    required this.name,
    required this.checkBoxWidget,
  });

  // final ChatModel chatModel;
  // final ChatModel sourceChat;
  final String name;
  final Widget checkBoxWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                trailing: checkBoxWidget,
                leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('assets/png/person.jpg')),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
