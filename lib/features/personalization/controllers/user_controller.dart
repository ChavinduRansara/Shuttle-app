import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> fetchUserRecords() async {
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }
  }

  Future<void> saveUserRecords(UserCredential? userCredential) async {
    try{
      if(userCredential != null){
        final newUser = UserModel(
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          uid: userCredential.user!.uid,
          profilePicture: userCredential.user!.photoURL,
          address: '',
        );
        
        await userRepository.saveUserDetails(newUser);
      }
    }catch(e){
      AppLoader.warnningSnackBar(title: AppText.dataNotSave, message: AppText.notSave);
    }
  }
}