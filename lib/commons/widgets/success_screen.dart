import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuttle_app/commons/styles/spacing_styles.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, this.email});

  final String? email;

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
                email?? '',
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
                  style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor, 
                            side: const BorderSide(color: AppColor.primaryColor),
                          ),
                  onPressed: () {
                    AuthenticationRepository.instance.screenRedirect();
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