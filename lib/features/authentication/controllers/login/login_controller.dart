import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> login() async {
    // Add your logic here
  }
}