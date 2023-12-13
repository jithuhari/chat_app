
import 'package:flutter/widgets.dart';
import 'flavors.dart';
import 'nmschat_app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await initNMSChatApp();
  runApp(const NMSChatApp());
}
