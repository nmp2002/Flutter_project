import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Row(children: [
        SizedBox(
          width: 20,
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
