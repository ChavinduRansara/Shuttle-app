import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }
      
      if (!forgetPasswordFormKey.currentState!.validate()) return;

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      AppLoader.successSnackBar(title: AppText.done, message: AppText.resetPasswordEmailSent);

      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

   reSendPasswordResetEmail(String email) async {
    try {

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      AppLoader.successSnackBar(title: AppText.done, message: AppText.resetPasswordEmailSent);

    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}