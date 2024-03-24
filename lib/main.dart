import 'dart:ui';

import 'package:bookingapp/routing/routing_scaffold.dart';
import 'package:bookingapp/screen/sign_in_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await myErrorsHandler.initialize();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    myErrorsHandler.onErrorDetails(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    myErrorsHandler.onError(error, stack);
    return true;
  };
  runApp(const MyApp());
}

mixin myErrorsHandler {
  static initialize() {}

  static void onErrorDetails(FlutterErrorDetails details) {}

  static void onError(Object error, StackTrace stack) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF7F7F7)),
      home: SignInPage(),
    );
  }
}
