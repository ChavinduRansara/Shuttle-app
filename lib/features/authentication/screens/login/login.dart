import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/features/authentication/controllers/login/login_controller.dart';
import 'package:shuttle_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/sign_up.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';
import 'package:shuttle_app/utils/validator/validation.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      key: controller.loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppText.login,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: AppSizes.spaceBtwInputFields),
                          customInputField(
                            controller: controller.email,
                            validatorFunction: (value) => AppValidator.validateEmail(value),
                            context,
                            label: AppText.email,
                            prefixIcon: Iconsax.direct,
                          ),
                          const SizedBox(height: AppSizes.spaceBtwInputFields),
                          customInputField(
                            controller: controller.password,
                            validatorFunction: (value) => AppValidator.validateEmpty(value),
                            context,
                            label: AppText.password,
                            prefixIcon: Iconsax.lock,
                            suffixIcon: Iconsax.eye_slash,
                          ),
                          const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: controller.rememberMe.value,
                                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                                      activeColor: AppColor.primaryColor,
                                    ),
                                  ),
                                  const Text(AppText.rememberMe),
                                ],
                              ),
                              const Spacer(),
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
                          const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                side: const BorderSide(color: AppColor.primaryColor),
                              ),
                              onPressed: () {
                                controller.login();
                              },
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
                  const SizedBox(height: AppSizes.spaceBtwSectios / 2),
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
                        AppText.orLoginWith,
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
          Obx(() {
            if (controller.loading.value) {
              return Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
