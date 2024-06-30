import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
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
              context,
              label: AppText.email,
              prefixIcon: Iconsax.direct_right,
            ),

            const SizedBox(height: AppSizes.defaultSpace),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
      )
    );
  }
}