import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'flavors.dart';
import 'package:flutter/services.dart';
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
  debugPrint("NMS chat app : Initialized");
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
