import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/features/authentication/controllers/password_configuration/forget_password.dart';
import 'package:shuttle_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Form(
          key: controller.forgetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.forgotPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
          
              const SizedBox(height: AppSizes.spaceBtwItems),
          
              Text(
                AppText.forgotPasswordDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
          
              const SizedBox(height: AppSizes.spaceBtwSectios),
              
              customInputField(
                controller: controller.email,
                context,
                label: AppText.email,
                prefixIcon: Iconsax.direct_right,
              ),
          
              const SizedBox(height: AppSizes.defaultSpace),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor, 
                              side: const BorderSide(color: AppColor.primaryColor),
                            ),
                  onPressed: (){
                    AppHelperFunctions.navigateToScreen(context, const ResetPassword());
                  }, 
                  child: const Text(
                    AppText.resetPassword,
                    style: TextStyle(
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