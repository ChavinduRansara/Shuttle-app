import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/sign_up.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final bool dark  = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight,
            bottom: AppSizes.defaultSpace,
          ),

          /// Column containing the logo, waves, and login form
          child: Column(
            children: [
              /// Logo
              const Image(
                height: 150,
                image: AssetImage(AppImages.logo),
              ),

              /// Waves
              const Image(
                height: 100,
                fit: BoxFit.cover,
                width: double.infinity,
                image: AssetImage(AppImages.waves),
              ),
            
              /// Login form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Login text
                      const Text(
                        AppText.login,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      customInputField(
                        context,
                        label: AppText.email,
                        prefixIcon: Iconsax.direct,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Password input field
                
                       customInputField(
                        context,
                        label: AppText.password,
                        prefixIcon: Iconsax.lock,
                        suffixIcon: Iconsax.eye_slash,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

                      /// Remember me and forgot password
                      Row(
                        children: [
                          /// Remember me
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: AppColor.primaryColor,
                              ),
                              const Text(AppText.rememberMe),
                            ],
                          ),

                          const Spacer(),

                          /// Forgot password
                          TextButton(
                            onPressed: () {
                              AppHelperFunctions.navigateToScreen(context, const ForgetPassword());
                            },
                            child: const Text(
                              AppText.forgotPassword,
                              style: TextStyle(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields/2),

                      /// Login button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor, 
                            side: const BorderSide(color: AppColor.primaryColor),
                          ),
                          onPressed: () {},
                          child: const Text(
                            AppText.login,
                            style: TextStyle(
                              fontSize: AppSizes.fontSm,
                              color: Colors.white, 
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwSectios/2),

              /// divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Flexible(
                      child: Divider(
                        color: dark ? AppColor.darkGray : AppColor.gray, thickness: 0.5, indent: 60, endIndent: 5,
                      ),
                    ),

                    Text(
                      AppText.orLoginWith,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),

                    Flexible(
                      child: Divider(
                        color: dark ? AppColor.darkGray : AppColor.gray, thickness: 0.5, indent: 5, endIndent: 60,
                      ),
                    ),
                  ]
              ),

              const SizedBox(height: AppSizes.spaceBtwSectios/2),

              /// Social media login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: dark ? AppColor.darkGray : AppColor.gray,
                      ),
                        borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      icon: const Image(
                        height: AppSizes.iconMd,
                        width: AppSizes.iconMd,
                        image: AssetImage(AppImages.googleLogo)
                        ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwSectios/4),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.dontHaveAccount,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),

                  TextButton(
                    onPressed: () {
                      AppHelperFunctions.navigateToScreen(context, const SignUpScreen());
                    },
                    child: const Text(
                      AppText.register,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],    
              ),
            ],
          ),
        ),
      ),
    );
  }
}
