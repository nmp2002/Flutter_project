import 'package:bookingapp/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                hintText: "Password",
                icon: Icons.password),
            SizedBox(
              height: 20,
            ),
            //name
            AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person),
            SizedBox(
              height: 20,
            ),
            //phone number
            AppTextField(
                textController: phoneController,
                hintText: "Phone number",
                icon: Icons.phone),
            SizedBox(
              height: 20 + 20,
            ),

            Container(
              width: 240,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
