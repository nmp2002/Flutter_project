import 'dart:ui';
import 'package:bookingapp/routing/routing_scaffold.dart';
import 'package:bookingapp/screen/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await myErrorsHandler.initialize();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    myErrorsHandler.onErrorDetails(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    myErrorsHandler.onError(error, stack);
    return true;
  };
  // SET UP FIREBASE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBQZZPCjWauGnoFlu0r-geepwWN9fboN6Y",
      appId: "1:597836804895:android:ff723469d32a418216762a",
      messagingSenderId: "597836804895",
      projectId: "bookingapp-62c6a",
    ),
  );
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
