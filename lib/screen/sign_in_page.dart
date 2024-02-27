import 'package:bookingapp/screen/sign_up_page.dart';
import 'package:bookingapp/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //logo
              Container(
                height: 300,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    backgroundImage: AssetImage("assets/image/logo_page1.png"),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chào mừng trở lại",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              SizedBox(
                height: 35,
              ),
              //email
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: 20,
              ),
              //password
              AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password),

              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 150),
                child: (RichText(
                    text: TextSpan(
                        text: "Đăng nhập bằng tài khoản của bạn",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        )))),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey),
                child: Center(
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              RichText(
                  text: TextSpan(
                      text: "Bạn chưa có tài khoản? ",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Get.to(SignUpPage(), transition: Transition.fade),
                        text: "Tạo mới",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))
                  ]))
            ],
          ),
        ));
  }
}
