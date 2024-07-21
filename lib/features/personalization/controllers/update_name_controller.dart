import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
import 'package:shuttle_app/navigation_menu.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  
  final loading = false.obs;
  final name = TextEditingController();
  final GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final userRepo = Get.put(UserRepository());

  get user => UserController.instance.user;
  
  Future<void> updateName() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      if (!updateNameFormKey.currentState!.validate()) return;

      loading.value = true; 
      
      Map<String, dynamic> data = {
        'name': name.text.trim(),
      };

      await userRepo.updateSingleField(data);

      userController.user.value.name = name.text.trim();

      loading.value = false; 

      AppLoader.successSnackBar(title: AppText.done, message: AppText.nameChangeSuccess);

      updateNameFormKey.currentState!.reset();
      
      Get.off(()=>const NavigationMenu());
    } catch (e) {
      loading.value = false; 
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }
  }

}
