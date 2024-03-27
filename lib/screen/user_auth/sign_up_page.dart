import 'package:bookingapp/mess/show_success.dart';
import 'package:bookingapp/mess/show_warning.dart';
import 'package:bookingapp/screen/user_auth/sign_in_page.dart';
import 'package:bookingapp/services/firebase_auth_service.dart';
import 'package:bookingapp/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
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

    void registration() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      if (name.isEmpty) {
        showWarning("Hãy nhập tên của bạn", title: "Tên");
      } else if (phone.isEmpty) {
        showWarning("Hãy nhập số điện thoại của bạn", title: "Số điện thoại");
      } else if (email.isEmpty) {
        showWarning("Hãy nhập email của bạn", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showWarning("Không tìm thấy địa chỉ email",
            title: "Email không hợp lệ");
      } else if (password.isEmpty) {
        showWarning("Hãy nhập mật khẩu của bạn", title: "Mật khẩu");
      } else if (password.length < 6) {
        showWarning("Mật khẩu không được dưới 6 kí tự", title: "Mật khẩu");
      } else {
        final FirebaseAuthService auth = FirebaseAuthService();

        User? user = await auth.signUp(email, password);
        if (user != null) {
          showSuccess("Đăng kí thành công", title: "Perfect");
        } else {
          print("ERROR");
        }
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
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
              SizedBox(
                height: 10,
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
                icon: Icons.password,
                isPassword: true,
              ),
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
              GestureDetector(
                onTap: () {
                  registration();
                },
                child: Container(
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
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Bạn đã có tài khoản rồi ?",
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  "Đăng nhập",
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
