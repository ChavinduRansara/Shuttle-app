import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:shuttle_app/commons/widgets/container/card.dart';
import 'package:shuttle_app/commons/widgets/container/custom_search_bar.dart';
import 'package:shuttle_app/commons/widgets/container/primary_header_container.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/commons/widgets/header_discription.dart';
import 'package:shuttle_app/commons/widgets/loaders/shimmer_loader.dart';
import 'package:shuttle_app/features/personalization/controllers/bus_controller.dart';
import 'package:shuttle_app/features/personalization/screens/home/book_service.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BusController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderDiscription(),
                  SizedBox(height: AppSizes.spaceBtwSectios / 2),
                  CustomSearchBar(text: 'Search here'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionHeading(
                    title: AppText.pickService,
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.busLoading.value) {
                      return Column(
                        children: List.generate(5, (index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
                            child: ShimmerLoader(width: double.infinity, height: 80),
                          );
                        }),
                      );
                    }
                    if (controller.buses.isEmpty) {
                      return const Center(child: Text('No buses available'));
                    }
                    return Column(
                      children: controller.buses.map((bus) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
                          child: ShuttleServiceCard(
                            serviceName: bus.routeName,
                            isAvailable: bus.isAvailable,
                            onTap: () {
                              if (!bus.isAvailable) {
                                return;
                              }
                              AppHelperFunctions.navigateToScreen(context, BookAService( routeName: bus.routeName, location: LatLng(bus.location.latitude, bus.location.longitude)));
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
