import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecords(UserCredential? userCredential) async {
    try{
      if(userCredential != null){
        final newUser = UserModel(
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          uid: userCredential.user!.uid,
        );
        
        await userRepository.saveUserDetails(newUser);
      }
    }catch(e){
      AppLoader.warnningSnackBar(title: AppText.dataNotSave, message: AppText.notSave);
    }
  }
}