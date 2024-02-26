import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StyleText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  StyleText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w400),
    );
  }
}
