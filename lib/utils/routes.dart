import 'package:get/get.dart';
import 'package:nms_chat/features/signin/signin.dart';

import '../features/chat_main_layout/chat_main_layout.dart';
import '../features/chat_window/chat_window.dart';
import '../features/new_chat/new_chat.dart';
import '../features/new_group/new_group.dart';

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

      //  Sign In/Sign Up Section
    ];
