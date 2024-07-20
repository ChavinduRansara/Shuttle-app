import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/container/circular_container.dart';
import 'package:shuttle_app/commons/widgets/container/curve_edge_widget.dart';
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
            CustomCurveEdgeWidget(
              child: Container(
                color: AppColor.primaryColor,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: CustomCircularContainer(backgroundColor: AppColor.textWhite.withOpacity(0.2),)
                      ),
                      Positioned(
                        top: 150,
                        right: -150,
                        child: CustomCircularContainer(backgroundColor: AppColor.textWhite.withOpacity(0.2),)
                      ),
                    ]
                  ),
                ),
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
                                AppText.logout,
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
    );
  }
}


