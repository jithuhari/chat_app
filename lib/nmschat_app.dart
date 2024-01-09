import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/app_controller.dart';
import 'flavors.dart';
import 'package:flutter/services.dart';
import 'repository/api_repository.dart';
import 'repository/nms_chat_api_repository.dart';
import 'utils/routes.dart';
import 'utils/screen_orientation.dart';
import 'utils/theme/app_theme.dart';

Future<void> initNMSChatApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait<void>([
    initializeAppControllers(),
  ]);
}

Future<void> initializeAppControllers() async {
  Get.put<ApiRepository>(ApiRepositoryImpl(), permanent: true);
  debugPrint("NMS chat app : Initialized");
  Get.put<NMSChatApiRepository>(NMSApiRepositoryImpl(), permanent: true);
  Get.put(AppController(), permanent: true);
  debugPrint("NMS chat app : AppController sucessfully initialized");
}

class NMSChatApp extends StatelessWidget {
  const NMSChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en'),
      title: F.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      navigatorObservers: [
        DismissKeyboardNavigationObserver(),
        NavigatorObserverWithOrientation(),
      ],
      getPages: routes(),
    );
  }
}

class DismissKeyboardNavigationObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.didStartUserGesture(route, previousRoute);
  }
}
