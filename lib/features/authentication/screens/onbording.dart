import 'package:flutter/material.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/sign_up.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image(
              height: AppHelperFunctions.screenHeight() * 0.3,
              width: AppHelperFunctions.screenWidth() * 0.8,
              image: const AssetImage(AppImages.onboardingImage),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),
            
            Text(
              AppText.description,
              style: Theme.of(context).textTheme.labelLarge,
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor, 
                      ),
                      onPressed: (){
                        AppHelperFunctions.navigateToScreen(context, const LoginScreen());
                      } ,
                        child: const Text(
                        AppText.login,
                        style: TextStyle(
                          fontSize: AppSizes.fontMd,
                          color: Colors.white, 
                          ),
                        ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  OutlinedButton(
                    onPressed: () {
                      AppHelperFunctions.navigateToScreen(context, const SignUpScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColor.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        AppText.register,
                        style: TextStyle(fontSize: AppSizes.fontMd, color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Image.asset(
              AppImages.onboardingWaves, 
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

