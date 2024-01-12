import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/utils/theme/theme.dart';
import '../../widgets/search_text_field.dart';
import '../tabbar_screens/all_chat/all_chat.dart';
import '../tabbar_screens/all_chat_search/all_chat_search.dart';
import 'chat_main_layout.dart';

class ChatMainLayoutScreen extends StatefulWidget {
  const ChatMainLayoutScreen({
    super.key,
    // required this.chatModels, required this.sourceChat
  });
  // final List<ChatModel> chatModels;
  // final ChatModel sourceChat;

  @override
  State<ChatMainLayoutScreen> createState() => _ChatMainLayoutScreenState();
}

class _ChatMainLayoutScreenState extends State<ChatMainLayoutScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatMainLayOutController>(
        init: ChatMainLayOutController(),
        builder: (controller) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              if (controller.searchDisplayValue == true) {
                // If search is displayed, close it and return false to prevent default back behavior
                controller.searchDisplay();
                return false;
              }
              return true; // Allow default back behavior if search is not displayed
            },
            child: SafeArea(
              child: Scaffold(
                appBar: controller.searchDisplayValue == false
                    ? AppBar(
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(
                              AppBar().preferredSize.height / 1.5),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 22, right: 21, bottom: 8),
                            child: Container(
                              height: 34,
                              width: 189,
                              decoration: BoxDecoration(
                                color: messageColor,
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: TabBar(
                                  controller: _controller,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      5.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                  labelColor: primaryColor,
                                  labelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  dividerColor: messageColor,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  unselectedLabelColor: Colors.white,
                                  tabs: const [
                                    Tab(
                                      text: 'All Chats',
                                    ),
                                    Tab(
                                      text: 'Groups',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        backgroundColor: const Color(0xffFAFAFA),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Inbox',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
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
                              child: const Icon(
                                Icons.search,
                                size: 24,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Icon(
                              Icons.filter_list,
                              size: 24,
                            ),
                          ),
                          PopupMenuButton(
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
                      )
                    : AppBar(
                        bottom: PreferredSize(
                            preferredSize: Size.fromHeight(
                                AppBar().preferredSize.height / .5),
                            child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                alignment: WrapAlignment.start,
                                children: controller.items
                                    .map(
                                      (e) => FilterChip(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        backgroundColor:
                                            const Color(0xffF1F1F1),
                                        selectedColor: primaryColor,
                                        showCheckmark: false,
                                        label: Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: controller.selectedItem
                                                      .contains(e)
                                                  ? Colors.white
                                                  : const Color(0xff7A7A7A)),
                                        ),
                                        selected:
                                            controller.selectedItem.contains(e),
                                        onSelected: (value) {
                                          if (controller.selectedItem
                                              .contains(e)) {
                                            controller.selectedItem.remove(e);
                                          } else {
                                            controller.selectedItem.add(e);
                                          }
                                          controller.update();
                                        },
                                      ),
                                    )
                                    .toList())),
                        backgroundColor: const Color(0xffFAFAFA),
                        actions: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 22, right: 23.8, bottom: 4),
                              child: SearchTextField(
                                controller: controller.chatSearchController,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Icon(
                              Icons.filter_list,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                body: controller.searchDisplayValue == false
                    ? Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 22, right: 23.8, bottom: 10),
                          //         child: SearchTextField(
                          //           controller: controller.chatSearchController,
                          //         ),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(right: 21),
                          //       child: IconButton(
                          //         iconSize: 24,
                          //         onPressed: () {},
                          //         icon: const Icon(Icons.filter_list),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 22, right: 21),
                          //   child: Container(
                          //     height: 34,
                          //     width: 189,
                          //     decoration: BoxDecoration(
                          //       color: messageColor,
                          //       borderRadius: BorderRadius.circular(
                          //         5.0,
                          //       ),
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(2.0),
                          //       child: TabBar(
                          //         controller: _controller,
                          //         indicator: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(
                          //             5.0,
                          //           ),
                          //           color: Colors.white,
                          //         ),
                          //         labelColor: primaryColor,
                          //         labelStyle: const TextStyle(
                          //             fontSize: 14, fontWeight: FontWeight.w700),
                          //         unselectedLabelStyle: const TextStyle(
                          //             fontSize: 14, fontWeight: FontWeight.w400),
                          //         dividerColor: messageColor,
                          //         indicatorSize: TabBarIndicatorSize.tab,
                          //         unselectedLabelColor: Colors.white,
                          //         tabs: const [
                          //           Tab(
                          //             text: 'All Chats',
                          //           ),
                          //           Tab(
                          //             text: 'Groups',
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _controller,
                                children: const [
                                  AllChatScreen(),
                                  Center(child: Text('Groups')),
                                ]),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _controller,
                                children: const [
                                  AllChatSearchScreen(),
                                  Center(child: Text('Groups')),
                                ]),
                          ),
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
