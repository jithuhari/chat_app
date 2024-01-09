import 'dart:async';
import 'package:flutter/material.dart';
import 'flavors.dart';
import 'nmschat_app.dart';

FutureOr<void> main() async {
  F.appFlavor = Flavor.dev;
  await initNMSChatApp();
  runApp(const NMSChatApp());
}

// testing first commit
// testing second commit