import 'dart:html';

import 'package:bookingapp/screen/account_page.dart';

import 'package:bookingapp/widgets/account_widgets.dart';
import 'package:bookingapp/widgets/app_icon.dart';
import 'package:bookingapp/widgets/dimensions.dart';
import 'package:bookingapp/widgets/styleText.dart';
import 'package:flutter/material.dart';

import '../widgets/colors.dart';

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
      body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 20),
          child: Column(children: [
            Icon(
              Icons.account_box_rounded,
              color: Color.fromARGB(255, 244, 184, 184),
              size: 120,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.person,
                      backgroudColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10 * 5 / 2,
                      size: Dimensions.height10 * 5,
                    ),
                    styleText: StyleText(
                      text: "Nguyễn Văn A",
                    )),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.phone,
                      backgroudColor: AppColors.iconColor3,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10 * 5 / 2,
                      size: Dimensions.height10 * 5,
                    ),
                    styleText: StyleText(
                      text: "0123456789",
                    )),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.email,
                      backgroudColor: AppColors.iconColor2,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10 * 5 / 2,
                      size: Dimensions.height10 * 5,
                    ),
                    styleText: StyleText(
                      text: "nva@gmail.com",
                    )),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on_sharp,
                      backgroudColor: AppColors.iconColor1,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10 * 5 / 2,
                      size: Dimensions.height10 * 5,
                    ),
                    styleText: StyleText(
                      text: "Hà Nội",
                    )),
                SizedBox(
                  height: Dimensions.height20,
                ),
              ]),
            ))
          ])),
    );
  }
}
