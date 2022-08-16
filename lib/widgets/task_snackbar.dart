import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/colors/app_colors.dart';


class SnackMessage {
  static void validationError(String taskName, String taskError) {
    Get.snackbar(
      taskName,
      taskError,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        taskName,
        style: const TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
          color: Color(0xFFEFC0C0),
        ),
      ),
      messageText: Text(
        taskError,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
