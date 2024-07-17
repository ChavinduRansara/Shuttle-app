import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                image: const AssetImage(AppImages.resetPassword),
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              Text(
                AppText.resetPasswordEmailSent,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              Text(
                AppText.resetPasswordSuccess,
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
                    Get.offAll(() => const LoginScreen());
                  },
                  child: const Text(
                    AppText.done,
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
                  onPressed: () {
                    ForgetPasswordController.instance.reSendPasswordResetEmail(email!);
                  },
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
      )
    );
  }
}