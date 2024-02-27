import 'package:bookingapp/widgets/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'app_icon.dart';
import 'styleText.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  StyleText styleText;

  AccountWidget({Key? key, required this.appIcon, required this.styleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(children: [
        appIcon,
        styleText,
        SizedBox(
          width: Dimensions.width20,
        )
      ]),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1)
      ]),
    );
  }
}
