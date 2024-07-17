import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }
  Future<void> login() async {
    try{

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }

      if(!loginFormKey.currentState!.validate()) return;

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMMBER_ME_PASSWORD', password.text.trim()); 
      } 

      final user = await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      AuthenticationRepository.instance.screenRedirect();

    } catch(e){
      Get.snackbar('Error', e.toString());
    }
  }
}