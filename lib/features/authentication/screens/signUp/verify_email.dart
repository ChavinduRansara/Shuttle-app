import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/success_screen.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.back(),
          ),
        
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: AppHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(AppImages.verifyEmail),
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              Text(
                AppText.verifyEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.defaultSpace),
              
              Text(
                "email@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              Text(
                AppText.verifyEmailInstructions,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.defaultSpace),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            side: const BorderSide(color: AppColor.primaryColor),
                          ),
                  onPressed: () {
                    AppHelperFunctions.navigateToScreen(context, const SuccessScreen());
                  },
                  child: const Text(
                    AppText.tcontinue,
                    style: TextStyle(
                      fontSize: AppSizes.fontSm,
                      ),
                    ),
                ),
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.resendEmail,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: AppSizes.fontSm,
                    ),
                  ),
                ),  
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}
 