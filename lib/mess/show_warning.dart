import 'package:bookingapp/widgets/styleText.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showWarning(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(title, message,
      titleText: StyleText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent);
}
