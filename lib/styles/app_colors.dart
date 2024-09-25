import 'package:flutter/material.dart';

class AppColors {
  static const offWhite = Color(0xffFCFCFC);
  static const pureBlack = Color(0xff000000);
  static const lightGrayish = Color(0xFFA1A0A0);
  static const veryLightGray = Color(0xFFEEEEEE);
  static const red = Color(0xFFF44336);
  static const lightPastelBlue = Color(0xffD3DEDC);
  static const green = Color(0xFF4CAF50);
  static const orange = Color(0xFFFF5500);
  static const midiumGray = Color(0xFF7F7F7F);
  static Color changeColor(countAllTasks, countCompleted) {
    late Color finalColor;
    countCompleted == 0
        ? finalColor = AppColors.midiumGray
        : countCompleted == countAllTasks
            ? finalColor = AppColors.green
            : finalColor = AppColors.orange;
    return finalColor;
  }
}
