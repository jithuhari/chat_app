import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/utils.dart';
import '../chat_window.dart';

Future<dynamic> messageBottomSheet(BuildContext context,
      String messageContent, ChatWindowController controller, int index) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      height: 3,
                      width: 75,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/love.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/laugh.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/sad.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/thumps_up.png'),
                          Image.asset(
                              'assets/png/message_bottom_sheet/add_reactions.png')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: messageContent));
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/copy.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Copy',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.pinMessageActive();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/pin.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Pin Message',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.starMessageActive();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(controller.isStarMessageActive == false
                              ? 'assets/png/message_bottom_sheet/star.png'
                              : 'assets/png/message_bottom_sheet/unstar.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Star Message',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        await controller.replyToMessage();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/reply.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Reply',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.toggleSelection(index);
                        controller.forwardActionActive();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/png/message_bottom_sheet/forward.png'),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text(
                            'Forward',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }

