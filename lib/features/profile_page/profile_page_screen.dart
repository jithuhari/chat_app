import 'package:flutter/material.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
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
                    Text('Mobile'),
                  ],
                ),
                const Row(
                  children: [
                    Text('+91 7876345178'),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Row(
                  children: [
                    Text('Mail'),
                  ],
                ),
                const Row(
                  children: [
                    Text('coder@gmail.com'),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Documents'),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
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
                    return Card(
                      color: Colors.red[100],
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  children: [
                    Text('Other Files'),
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
                        Text('Docs'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
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
                        Text('Videos'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
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
