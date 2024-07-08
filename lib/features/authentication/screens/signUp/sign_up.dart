import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/utils/validator/validation.dart'; 

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark  = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight,
            bottom: AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const Image(
                height: 150,
                image: AssetImage(AppImages.logo),
              ),
              const Image(
                height: 100,
                fit: BoxFit.cover,
                width: double.infinity,
                image: AssetImage(AppImages.waves),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Sign Up text
                      const Text(
                        AppText.register,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Input field for name
                      customInputField(
                        controller: controller.name,
                        validatorFunction: (value) => AppValidator.validateEmpty(value),
                        context,
                        label: AppText.name,
                        prefixIcon: Iconsax.user_edit,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Input field for email
                      customInputField(
                        controller: controller.email,
                        validatorFunction: (value) => AppValidator.validateEmail(value),
                        context,
                        label: AppText.email,
                        prefixIcon: Iconsax.direct,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Input field for phone number
                      customInputField(
                        controller: controller.phoneNumber,
                        validatorFunction: (value) => AppValidator.validatePhoneNumber(value),
                        context,
                        label: AppText.phoneNumber,
                        prefixIcon: Iconsax.call,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),
                      
                      /// Input field for password
                      customInputField(
                        controller: controller.password,
                        validatorFunction: (value) => AppValidator.validateEmpty(value),
                        context,
                        label: AppText.password,
                        prefixIcon: Iconsax.lock,
                        suffixIcon: Iconsax.eye_slash,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Input field for confirm password
                      customInputField(
                        controller: controller.confirmPassword,
                        validatorFunction: (value) => AppValidator.validateConfirmPassword(value, controller.password.text),
                        context,
                        label: AppText.confirmPassword,
                        prefixIcon: Iconsax.lock,
                        suffixIcon: Iconsax.eye_slash,
                      ),

                      const SizedBox(height: AppSizes.spaceBtwInputFields),

                      /// Sign up button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            side: const BorderSide(color: AppColor.primaryColor),
                          ),
                          onPressed: () {
                            controller.signUp();
                          },
                          child: const Text(
                            AppText.register,
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

              const SizedBox(height: AppSizes.spaceBtwSectios / 2),

              /// Or sign up with text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? AppColor.darkGray : AppColor.gray,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    AppText.orSignUpWith,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? AppColor.darkGray : AppColor.gray,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwSectios / 2),

              /// Google sign up button
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
                        image: AssetImage(AppImages.googleLogo),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwSectios / 4),

              /// Already have an account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.haveAccount,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      AppHelperFunctions.navigateToScreen(context, const LoginScreen());
                    },
                    child: const Text(
                      AppText.login,
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
