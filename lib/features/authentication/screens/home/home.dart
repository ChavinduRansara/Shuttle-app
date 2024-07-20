import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/container/custom_search_bar.dart';
import 'package:shuttle_app/commons/widgets/container/primary_header_container.dart';
import 'package:shuttle_app/commons/widgets/header_discription.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderDiscription(), 

                  SizedBox(height: AppSizes.spaceBtwSectios/2,),
                  
                  CustomSearchBar(text: 'Search here',), 
                ],
              ),
            ),

            

            SizedBox(
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
            // Your other widgets go here
          ],
        ),
      ),
    );
  }
}

