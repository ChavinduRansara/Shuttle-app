import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/commons/widgets/container/circular_image.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
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
              const AppSectionHeading(title: 'Profile Information')
            ],
          ),
        ),
      ),
    );
  }
}