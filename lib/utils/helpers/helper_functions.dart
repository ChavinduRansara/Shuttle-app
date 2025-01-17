import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHelperFunctions {

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void navigateToScreenWithReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return screenSize().height;
  }

  static double screenWidth() {
    return screenSize().width;
  }

}
