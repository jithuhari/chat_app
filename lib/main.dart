import 'dart:async';
import 'package:flutter/material.dart';
import 'nmschat_app.dart';

FutureOr<void> main() async {
  await initNMSChatApp();
  runApp(const NMSChatApp());
}