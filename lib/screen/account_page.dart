import 'dart:html';

import 'package:bookingapp/screen/account_page.dart';
import 'package:bookingapp/widgets/account_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 187, 224),
          title: Center(
              child: Text(
            "Thông tin tài khoản",
            style: TextStyle(
              color: Color.fromARGB(255, 249, 247, 247),
              fontSize: 30,
            ),
          )),
        ),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 4, 4, 4),
                size: 120,
              ),
              AccountWidget()
            ],
          ),
        ));
  }
}
