
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/commons/widgets/container/circular_image.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/commons/widgets/loaders/shimmer_loader.dart';
import 'package:shuttle_app/commons/widgets/profile/profile_menu.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
import 'package:shuttle_app/features/personalization/screens/profile/change_address.dart';
import 'package:shuttle_app/features/personalization/screens/profile/change_name.dart';
import 'package:shuttle_app/features/personalization/screens/profile/change_phone_number.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(AuthenticationRepository());
    final userController = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(AppText.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx( () {
                      final networkImage = userController.user.value.profilePicture;
                      final image = networkImage!.isNotEmpty ? networkImage : AppImages.profile;
                      return userController.imageUploadLoading.value
                      ? const ShimmerLoader(width: 80, height: 80, radius: 80,)
                      : CircularImage(
                          isNetworkImage: networkImage.isNotEmpty,
                          image: image, 
                          width: 80, 
                          height: 80,
                          backgroundColor: AppColor.gray,
                        );}
                    ),
                    
                    TextButton(
                      onPressed: (){userController.uploadUserProfilePicture();}, 
                      child: Text(
                        AppText.changePicture,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    )
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              const AppSectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              Obx(()=> AppProfileMenu(title: 'Name', value: userController.user.value.name, onPressed: (){AppHelperFunctions.navigateToScreen(context, const ChangeName());},)),
              AppProfileMenu(title: 'User Name', value: userController.user.value.email, icon: Iconsax.copy, onPressed: (){},),
              
              const SizedBox(height: AppSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              const AppSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              AppProfileMenu(title: 'User ID', value: userController.user.value.uid, icon: Iconsax.copy, onPressed: (){},),
              AppProfileMenu(title: 'E-mail', value: userController.user.value.email, icon: Iconsax.copy, onPressed: (){},),
              Obx(()=> AppProfileMenu(title: 'Phone Number', value: userController.user.value.phoneNumber, onPressed: (){AppHelperFunctions.navigateToScreen(context, const ChangePhoneNumber());},)),
              Obx(()=> AppProfileMenu(title: 'Address', value: userController.user.value.address??'', onPressed: (){AppHelperFunctions.navigateToScreen(context, const ChangeAddress());},)),

              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColor.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: (){
                    controller.signOut();
                  },
                  
                  child: const Text(AppText.signOut, style: TextStyle(color: AppColor.primaryColor),),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems/2,),
              
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

