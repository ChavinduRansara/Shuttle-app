import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final loading = false.obs; 
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> login() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      if (!loginFormKey.currentState!.validate()) return;

      loading.value = true; 

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      loading.value = false; 

      AuthenticationRepository.instance.screenRedirect();
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
