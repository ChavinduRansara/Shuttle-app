import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/verify_email.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final loading = false.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signUp() async {
    try {
      if (!signUpFormKey.currentState!.validate()) return;

      loading.value = true; // Start loading

      final user = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        uid: user.user!.uid,
      );

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserDetails(newUser);

      loading.value = false; // Stop loading

      AppLoader.successSnackBar(title: AppText.signUpSuccess, message: AppText.signUpSuccessMessage);
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      loading.value = false; // Stop loading
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }
  }
}
