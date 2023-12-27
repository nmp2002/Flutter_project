import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.isActive,
      required this.index});

  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.black87.withOpacity(.3),
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
          ],
        ),
        child: Icon(
          icon,
          color: isActive ? Color(0xFFFF90BC) : Colors.grey[400],
        ),
      ),
    );
  }
}
