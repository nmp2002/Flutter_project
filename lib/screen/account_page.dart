import 'package:bookingapp/screen/user_auth/sign_in_page.dart';
import 'package:bookingapp/services/firebase_auth_service.dart';
import 'package:bookingapp/widgets/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/styleText.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: StyleText(
              text: "Tài khoản",
              size: 24,
              color: Colors.white,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Icon Account
              Center(
                child: Icon(
                  Icons.account_circle,
                  size: 120,
                  color: Color.fromARGB(255, 243, 210, 221),
                ),
              ),
              SizedBox(height: 20),

              // User Information Widgets
              _buildAccountInfoItem(Icons.person, "Nguyễn Văn A"),
              SizedBox(height: 20),
              _buildAccountInfoItem(Icons.phone, "0123456789"),
              SizedBox(height: 20),
              _buildAccountInfoItem(Icons.email, "nva@gmail.com"),
              SizedBox(height: 20),
              _buildAccountInfoItem(Icons.location_on, "Hà Nội"),
              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý khi người dùng nhấn đăng xuất
                  final FirebaseAuthService auth = FirebaseAuthService();
                  auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text("Đăng xuất"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoItem(IconData icon, String text) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountPage(),
  ));
}
