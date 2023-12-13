import 'package:get/get.dart';

import '../features/hello_world.dart';

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const HelloWorld(),
          transition: Transition.cupertino),

      // GetPage(
      //     name: "/splash_screen",
      //     page: () => const SplashScreen(),
      //     transition: Transition.cupertino),

      //  Sign In/Sign Up Section
    ];
