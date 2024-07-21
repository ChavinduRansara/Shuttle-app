import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/verify_email.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
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
  final userController = Get.put(UserController());
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signUp() async {
    try {
      
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      if (!signUpFormKey.currentState!.validate()) return;

      loading.value = true; 

      final user = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        uid: user.user!.uid,
        profilePicture: user.user!.photoURL,
      );

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserDetails(newUser);

      loading.value = false; 
      AppLoader.successSnackBar(title: AppText.signUpSuccess, message: AppText.signUpSuccessMessage);
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      loading.value = false; 
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }
  }

  Future<void> googleLogin() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      loading.value = true; 

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecords(userCredentials);

      loading.value = false; 

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      loading.value = false; 
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }
  }
}
