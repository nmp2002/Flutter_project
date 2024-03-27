import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  const AppTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isPassword = false});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Stack(children: [
        TextField(
          obscureText: !isShowPassword && widget.isPassword,
          controller: widget.textController,
          decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: Icon(
                widget.icon,
                color: Color.fromARGB(255, 237, 129, 219),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              )),
        ),
        widget.isPassword
            ? Positioned(
                top: 6,
                right: 4,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
                      size: 28,
                      isShowPassword ? Icons.visibility_off : Icons.visibility),
                ),
              )
            : Text("")
      ]),
    );
  }
}
