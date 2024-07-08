import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    // Add your logic here
  }
}