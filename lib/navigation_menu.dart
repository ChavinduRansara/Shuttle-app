import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/features/personalization/screens/home/home.dart';
import 'package:shuttle_app/features/personalization/screens/map/user_ride.dart';
import 'package:shuttle_app/features/personalization/screens/profile/profile.dart';
import 'package:shuttle_app/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatioController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          indicatorColor: AppColor.secondaryColor,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            NavigationDestination(icon: Icon(Iconsax.map), label: 'Journey'),
            NavigationDestination(icon: Icon(Iconsax.clock), label: 'History'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigatioController extends GetxController {

  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const RideScreen(),
    Container(color: Colors.blue),
  ];


}