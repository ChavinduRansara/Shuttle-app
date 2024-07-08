import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/verify_email.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';
import 'package:shuttle_app/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();


  void signUp() async {
    try{

      
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      if(!signUpFormKey.currentState!.validate()) return;

      final user = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      
      final newUser = UserModel(
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        uid: user.user!.uid,
      );

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserDetails(newUser);

      AppLoader.successSnackBar(title: AppText.signUpSuccess, message: AppText.signUpSuccessMessage);

      Get.to(() => const VerifyEmailScreen());
    } catch(e){
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }

  }
}