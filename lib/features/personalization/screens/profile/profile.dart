import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/commons/widgets/container/circular_image.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/commons/widgets/profile/profile_menu.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(AuthenticationRepository());
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
                    const CircularImage(
                      image: AppImages.profile, 
                      width: 80, 
                      height: 80,
                      backgroundColor: AppColor.gray,
                    ),
                    TextButton(
                      onPressed: (){}, 
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

              AppProfileMenu(title: 'Name', value: 'Chavindu Ransara', onPressed: (){},),
              AppProfileMenu(title: 'User Name', value: 'chavindu@gmail.com', onPressed: (){},),
              
              const SizedBox(height: AppSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              const AppSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              AppProfileMenu(title: 'User ID', value: '1234', icon: Iconsax.copy, onPressed: (){},),
              AppProfileMenu(title: 'E-mail', value: 'chavindu@gmail.com', onPressed: (){},),
              AppProfileMenu(title: 'Phone Number', value: '0744567887', onPressed: (){},),
              AppProfileMenu(title: 'Address', value: '223/4, Galle road, Galle', onPressed: (){},),

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

