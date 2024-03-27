import 'package:bookingapp/mess/show_success.dart';
import 'package:bookingapp/screen/user_auth/sign_up_page.dart';
import 'package:bookingapp/services/firebase_auth_service.dart';
import 'package:bookingapp/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routing/routing_scaffold.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      final FirebaseAuthService auth = FirebaseAuthService();

      User? user = await auth.signIn(email, password);
      if (user != null) {
        showSuccess("Đăng nhập thành công", title: "Perfect");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RoutingScaffold()),
        );
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              //logo
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: const Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      backgroundImage:
                          AssetImage("assets/image/logo_page1.png"),
                    ),
                  ),
                ),
              ),

              Text(
                "BOOKING",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                "Hãy tham gia với chúng tôi",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(
                height: 35,
              ),
              //email
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              const SizedBox(
                height: 20,
              ),
              //password
              AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password,
                  isPassword: true),

              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  login();
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey),
                  child: const Center(
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
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Bạn chưa có tài khoản rồi ?",
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Đăng kí",
                  style: TextStyle(
                    color: Color.fromARGB(255, 237, 129, 219),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
