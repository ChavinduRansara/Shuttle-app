import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
import 'package:shuttle_app/navigation_menu.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/network_manager.dart';

class UpdateAddressController extends GetxController {
  static UpdateAddressController get instance => Get.find();
  
  final loading = false.obs;
  final address = TextEditingController();
  final GlobalKey<FormState> updateAddressFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final userRepo = Get.put(UserRepository());

  get user => UserController.instance.user;

  Future<void> updateaddress() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoader.warnningSnackBar(title: AppText.oops, message: AppText.noInternet);
        return;
      }

      if (!updateAddressFormKey.currentState!.validate()) return;

      loading.value = true; 
      
      Map<String, dynamic> data = {
        'address': address.text.trim(),
      };

      await userRepo.updateSingleField(data);

      userController.user.value.address = address.text.trim();

      loading.value = false; 

      AppLoader.successSnackBar(title: AppText.done, message: AppText.addressChangeSuccess);
      
      updateAddressFormKey.currentState!.reset();
      
      Get.off(()=>const NavigationMenu());
    } catch (e) {
      loading.value = false; 
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }
  }

}
