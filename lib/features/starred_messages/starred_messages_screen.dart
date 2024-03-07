import 'package:flutter/material.dart';

class StarredMessagesScreen extends StatelessWidget {
  const StarredMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: SizedBox(
              width: MediaQuery.of(context).size.width - 140,
              child: const Center(child: Text('Starred Messages'))),
        ),
      ),
    );
  }
}
