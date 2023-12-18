import 'package:get/get.dart';
import 'package:nms_chat/features/signin/signin.dart';

import '../features/chat_main_layout/chat_main_layout.dart';

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const SignInScreen(),
          transition: Transition.cupertino),

      GetPage(
          name: "/chat_main_layout_screen",
          page: () => const ChatMainLayoutScreen(),
          transition: Transition.cupertino),

      //  Sign In/Sign Up Section
    ];
