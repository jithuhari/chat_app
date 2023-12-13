import 'package:get/get.dart';
import 'package:nms_chat/features/signin/signin.dart';


List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const SignInScreen(),
          transition: Transition.cupertino),

      // GetPage(
      //     name: "/splash_screen",
      //     page: () => const SplashScreen(),
      //     transition: Transition.cupertino),

      //  Sign In/Sign Up Section
    ];
