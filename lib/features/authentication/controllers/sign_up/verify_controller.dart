import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/commons/widgets/success_screen.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      AppLoader.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async { 
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(email: user!.email.toString().trim(),));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(() => SuccessScreen(email: user.email.toString().trim(),));
    }
  }
}