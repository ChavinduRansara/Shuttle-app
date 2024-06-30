import 'package:flutter/material.dart';
import 'package:shuttle_app/commons/styles/spacing_styles.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBar * 2,
          child: Column(
            children: [
              Image(
                width: AppHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(AppImages.successImage),
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              Text(
                AppText.accountCreated,
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
                AppText.successScreenDescription,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.defaultSpace),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AppHelperFunctions.navigateToScreen(context, const LoginScreen());
                  },
                  child: const Text(
                    AppText.tcontinue,
                    style: TextStyle(
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