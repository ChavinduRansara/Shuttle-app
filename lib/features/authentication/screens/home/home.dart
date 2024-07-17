import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: SizedBox(
                width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                side: const BorderSide(color: AppColor.primaryColor),
                              ),
                              onPressed: () {
                                controller.signOut();
                              },
                              child: const Text(
                                AppText.signOut,
                                style: TextStyle(
                                  fontSize: AppSizes.fontSm,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

      ),
    );
  }
}