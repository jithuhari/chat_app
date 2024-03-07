import 'package:get/get.dart';
import 'package:nms_chat/features/signin/signin.dart';
import 'package:nms_chat/features/starred_messages/starred_messages.dart';

import '../features/chat_main_layout/chat_main_layout.dart';
import '../features/chat_window/chat_window.dart';
import '../features/new_chat/new_chat.dart';
import '../features/new_group/new_group.dart';
import '../features/profile_page/profile_page.dart';

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const SignInScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/chat_main_layout_screen",
          page: () => const ChatMainLayoutScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/new_chat_screen",
          page: () => const NewChatScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/new_group_screen",
          page: () => const NewGroupScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/chat_window_screen",
          page: () => const ChatWindowScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/profile_page_screen",
          page: () => const ProfilePageScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/starred_message_screen",
          page: () => const StarredMessagesScreen(),
          transition: Transition.cupertino),

      //  Sign In/Sign Up Section
    ];
