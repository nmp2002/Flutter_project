import 'package:bookingapp/screen/sign_in_page.dart';
import 'package:bookingapp/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = ["gg.png", "fb.png"];

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
                  hintText: "Mật khẩu",
                  icon: Icons.password),
              SizedBox(
                height: 20,
              ),
              //name
              AppTextField(
                  textController: nameController,
                  hintText: "Tên",
                  icon: Icons.person),
              SizedBox(
                height: 20,
              ),
              //phone number
              AppTextField(
                  textController: phoneController,
                  hintText: "Số điện thoại",
                  icon: Icons.phone),
              SizedBox(
                height: 20 + 20,
              ),

              //sign up button
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey),
                child: Center(
                  child: Text(
                    "Đăng kí",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(SignInPage(),
                            transition: Transition.downToUp),
                      text: "Bạn đã có tài khoản rồi?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ))),
              SizedBox(
                height: 10,
              ),
              // Option
              RichText(
                  text: TextSpan(
                      text: "Đăng kí bằng các phương thức bên dưới",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ))),
              Wrap(
                children: List.generate(
                    2,
                    (index) => Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                "assets/image/" + singUpImages[index]),
                          ),
                        )),
              )
            ],
          ),
        ));
  }
}
