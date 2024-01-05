import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  // Define your AppColor class or replace it with your actual implementation.
  static const Color appBgColor = Colors.white;
  static const Color appBarColor = Colors.blue;
  static const Color textColor = Colors.black;
  static const Color orange = Colors.orange;
  static const Color blue = Colors.blue;
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color labelColor = Colors.grey;
  static const Color actionColor = Colors.red; // Change to your desired color
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
          ),
        ],
      ),
    );
  }
}
