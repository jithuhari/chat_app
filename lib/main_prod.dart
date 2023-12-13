import 'package:flutter/widgets.dart';
import 'package:nms_chat/nmschat_app.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await initNMSChatApp();
  runApp(const NMSChatApp());
}
