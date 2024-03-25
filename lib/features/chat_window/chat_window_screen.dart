import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_chat/features/chat_window/chat_window.dart';
import 'package:nms_chat/widgets/message_widgets/own_message_card.dart';
import 'package:nms_chat/widgets/message_widgets/reply_message_card.dart';

import '../../utils/utils.dart';
import 'widgets/check_box_widget.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/message_bottom_sheet.dart';
import 'widgets/search_app_bar_widget.dart';

class ChatWindowScreen extends StatelessWidget {
  const ChatWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatWindowController>(
        init: ChatWindowController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: controller.searchDisplayValue == false
                  ? mainAppBar(controller, context)
                  : searhAppBarWidget(controller),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                        height: controller.isPinMessageActive == true
                            ? MediaQuery.of(context).size.height * .66
                            : controller.isReplyActive == true
                                ? MediaQuery.of(context).size.height * .67
                                : MediaQuery.of(context).size.height * .73,
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: controller.isInitialMessageshow == true
                                ? controller.initialOldMessages.length
                                : controller.historicalMessages.length,
                            itemBuilder: (context, index) {
                              if (controller.isInitialMessageshow == true
                                  ? controller
                                          .reversedOldMessageSenderId[index] ==
                                      88
                                  : controller.reversedHistoricalMessageSenderId[
                                          index] ==
                                      88) {
                                return controller.isInitialMessageshow == true
                                    ? Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? chekBoxWidget(controller, index)
                                              : Container(),
                                          Expanded(
                                            child: OwnMessageCard(
                                                onLongPress: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  messageBottomSheet(
                                                      context,
                                                      controller
                                                              .reversedOldMessages[
                                                          index],
                                                      controller,
                                                      index);
                                                },
                                                ownMessageTime: controller
                                                            .isInitialMessageshow ==
                                                        true
                                                    ? controller
                                                        .convertToIndianTime(
                                                            controller
                                                                    .reversedtimeoldMessages[
                                                                index])
                                                    : controller
                                                        .convertToIndianTime(
                                                            controller
                                                                    .reversedtimeHistoricMessages[
                                                                index]),
                                                ownMessage: controller
                                                        .reversedOldMessages[
                                                    index]),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? chekBoxWidget(controller, index)
                                              : Container(),
                                          Expanded(
                                            child: OwnMessageCard(
                                                ownMessageTime: controller
                                                            .isInitialMessageshow ==
                                                        true
                                                    ? controller
                                                        .convertToIndianTime(
                                                            controller
                                                                    .reversedtimeoldMessages[
                                                                index])
                                                    : controller
                                                        .convertToIndianTime(
                                                            controller
                                                                    .reversedtimeHistoricMessages[
                                                                index]),
                                                onLongPress: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  messageBottomSheet(
                                                      context,
                                                      controller
                                                              .reversedMessages[
                                                          index],
                                                      controller,
                                                      index);
                                                },
                                                ownMessage: controller
                                                    .reversedMessages[index]),
                                          ),
                                        ],
                                      );
                              } else {
                                return controller.isInitialMessageshow == true
                                    ? Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? chekBoxWidget(controller, index)
                                              : Container(),
                                          Expanded(
                                            child: ReplyMessageCard(
                                              starMessageWidget: controller
                                                          .isStarMessageActive ==
                                                      false
                                                  ? Container()
                                                  : Image.asset(
                                                      'assets/png/star_msg.png'),
                                              replyMessageTime: controller
                                                          .isInitialMessageshow ==
                                                      true
                                                  ? controller.convertToIndianTime(
                                                      controller
                                                              .reversedtimeoldMessages[
                                                          index])
                                                  : controller.convertToIndianTime(
                                                      controller
                                                              .reversedtimeHistoricMessages[
                                                          index]),
                                              onLongPress: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                messageBottomSheet(
                                                    context,
                                                    controller
                                                            .reversedOldMessages[
                                                        index],
                                                    controller,
                                                    index);
                                              },
                                              replyMessage: controller
                                                  .reversedOldMessages[index],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          controller.isForwardActive == true
                                              ? chekBoxWidget(controller, index)
                                              : Container(),
                                          Expanded(
                                            child: ReplyMessageCard(
                                              starMessageWidget: controller
                                                          .isStarMessageActive ==
                                                      false
                                                  ? Container()
                                                  : Image.asset(
                                                      'assets/png/star_msg.png'),
                                              replyMessageTime: controller
                                                          .isInitialMessageshow ==
                                                      true
                                                  ? controller.convertToIndianTime(
                                                      controller
                                                              .reversedtimeoldMessages[
                                                          index])
                                                  : controller.convertToIndianTime(
                                                      controller
                                                              .reversedtimeHistoricMessages[
                                                          index]),
                                              onLongPress: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                messageBottomSheet(
                                                    context,
                                                    controller.reversedMessages[
                                                        index],
                                                    controller,
                                                    index);
                                              },
                                              replyMessage: controller
                                                  .reversedMessages[index],
                                            ),
                                          ),
                                        ],
                                      );
                              }
                            })),
                    controller.searchDisplayValue == true
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 65,
                              color: cardColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: InkWell(
                                          onTap: () {
                                            if (controller.isSendButton ==
                                                true) {
                                              FocusScope.of(context).unfocus();
                                              controller
                                                  .isInitialMessageshowfalse();
                                              controller.sendMessage(
                                                  controller
                                                      .msgTextController.text,
                                                  88,
                                                  controller.receiverId,
                                                  1);
                                              controller.msgTextController
                                                  .clear();
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/png/arrow_up.png'))),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: InkWell(
                                          onTap: () {
                                            if (controller.isSendButton ==
                                                true) {
                                              FocusScope.of(context).unfocus();
                                              controller
                                                  .isInitialMessageshowfalse();
                                              controller.sendMessage(
                                                  controller
                                                      .msgTextController.text,
                                                  88,
                                                  controller.receiverId,
                                                  1);
                                              controller.msgTextController
                                                  .clear();
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/png/arrow_down.png'))),
                                ],
                              ),
                            ),
                          )
                        : controller.isForwardActive == true
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 65,
                                  color: cardColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: InkWell(
                                                onTap: () {
                                                  controller.selectedIndexes
                                                      .clear();
                                                  controller
                                                      .clearSelectedCOunt();
                                                  controller
                                                      .forwardActionActive();
                                                },
                                                child: Image.asset(
                                                    'assets/png/Cancel.png')),
                                          ),
                                          Text(
                                            '${controller.selectedCount} Selected',
                                            style: const TextStyle(
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: InkWell(
                                              onTap: () {
                                                if (controller.isSendButton ==
                                                    true) {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  controller
                                                      .isInitialMessageshowfalse();
                                                  controller.sendMessage(
                                                      controller
                                                          .msgTextController
                                                          .text,
                                                      88,
                                                      controller.receiverId,
                                                      1);
                                                  controller.msgTextController
                                                      .clear();
                                                }
                                              },
                                              child: controller
                                                      .selectedIndexes.isEmpty
                                                  ? Image.asset(
                                                      'assets/png/forward.png')
                                                  : Image.asset(
                                                      'assets/png/forward_active.png'))),
                                    ],
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: controller.isReplyActive == false
                                    ? Container(
                                        color: cardColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Image.asset(
                                                  'assets/png/Plus.png'),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    140,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 13),
                                                  child: Container(
                                                      height: 38,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextFormField(
                                                        focusNode: controller
                                                            .msgTextFocusNode,
                                                        controller: controller
                                                            .msgTextController,
                                                        onChanged: (value) {
                                                          if (value
                                                              .isNotEmpty) {
                                                            controller
                                                                .changeSendButtonStatusToTrue();
                                                          } else {
                                                            controller
                                                                .changeSendButtonStatusTofalse();
                                                          }
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .top,
                                                        maxLines: 5,
                                                        minLines: 1,
                                                        decoration:
                                                            const InputDecoration(
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xffF1F1F1))),
                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Type a message...',
                                                          hintStyle: TextStyle(
                                                              color: hintColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          contentPadding:
                                                              EdgeInsets.all(5),
                                                        ),
                                                      )),
                                                )),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: InkWell(
                                                    onTap: () {
                                                      if (controller
                                                              .isSendButton ==
                                                          true) {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        controller
                                                            .isInitialMessageshowfalse();
                                                        controller.sendMessage(
                                                            controller
                                                                .msgTextController
                                                                .text,
                                                            88,
                                                            controller
                                                                .receiverId,
                                                            1);
                                                        controller
                                                            .msgTextController
                                                            .clear();
                                                      }
                                                    },
                                                    child: Image.asset(controller
                                                                .isSendButton ==
                                                            false
                                                        ? 'assets/png/microphone.png'
                                                        : 'assets/png/send.png'))),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: replyMessageColor),
                                        )),
                                        height: 110,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: 5,
                                                      height: 40,
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Esther Howard',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          'Lorem Ipsum dolor sit amet Lorem ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .replyToMessageClose();
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: messageColor,
                                                      )),
                                                )
                                              ],
                                            ),
                                            Container(
                                              color: cardColor,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    child: Image.asset(
                                                        'assets/png/Plus.png'),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              140,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 13),
                                                        child: Container(
                                                            height: 38,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              focusNode: controller
                                                                  .msgTextFocusNode,
                                                              controller: controller
                                                                  .msgTextController,
                                                              onChanged:
                                                                  (value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  controller
                                                                      .changeSendButtonStatusToTrue();
                                                                } else {
                                                                  controller
                                                                      .changeSendButtonStatusTofalse();
                                                                }
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .multiline,
                                                              textAlignVertical:
                                                                  TextAlignVertical
                                                                      .top,
                                                              maxLines: 5,
                                                              minLines: 1,
                                                              decoration:
                                                                  const InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Color(0xffF1F1F1))),
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Type a message...',
                                                                hintStyle: TextStyle(
                                                                    color:
                                                                        hintColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                              ),
                                                            )),
                                                      )),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16.0),
                                                      child: InkWell(
                                                          onTap: () {
                                                            if (controller
                                                                    .isSendButton ==
                                                                true) {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              controller
                                                                  .isInitialMessageshowfalse();
                                                              controller.sendMessage(
                                                                  controller
                                                                      .msgTextController
                                                                      .text,
                                                                  88,
                                                                  controller
                                                                      .receiverId,
                                                                  1);
                                                              controller
                                                                  .msgTextController
                                                                  .clear();
                                                            }
                                                          },
                                                          child: Image.asset(controller
                                                                      .isSendButton ==
                                                                  false
                                                              ? 'assets/png/microphone.png'
                                                              : 'assets/png/send.png'))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
