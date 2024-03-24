import 'package:bookingapp/widgets/colors.dart';
import 'package:flutter/material.dart';

import 'styleText.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: StyleText(
              text: "Thông tin tài khoản",
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
              _buildAccountInfoItem(Icons.phone, "0123456789"),
              _buildAccountInfoItem(Icons.email, "nva@gmail.com"),
              _buildAccountInfoItem(Icons.location_on, "Hà Nội"),
              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý khi người dùng nhấn đăng xuất
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
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountPage(),
  ));
}
