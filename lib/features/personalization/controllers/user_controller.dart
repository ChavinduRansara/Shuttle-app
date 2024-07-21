import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/user/user_repository.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final imageUploadLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> fetchUserRecords() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecords(UserCredential? userCredential) async {
    try{
      await fetchUserRecords();

      if(user.value.uid.isEmpty){
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
      }    
    }catch(e){
      AppLoader.warnningSnackBar(title: AppText.dataNotSave, message: AppText.notSave);
    }
  }

  uploadUserProfilePicture() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image != null){
        imageUploadLoading.value = true;

        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> data = {
        'profilePicture': imageUrl,
      };

      await userRepository.updateSingleField(data);

      user.value.profilePicture = imageUrl;
      user.refresh();

      AppLoader.successSnackBar(title: AppText.done, message: AppText.pictureUpdateSuccess);
      }

    }catch(e){
      AppLoader.errorSnackBar(title: AppText.somthingWrong, message: e.toString());
    }finally{
      imageUploadLoading.value = false;
    }
    
  }
}