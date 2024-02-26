import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StyleText2 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  StyleText2(
      {Key? key,
      this.color = const Color.fromARGB(255, 243, 188, 210),
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}
