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
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(children: [
            AppIcon(
              icon: Icons.account_box,
              backgroudColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height30 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
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
                ))
          ]),
        ));
  }
}
