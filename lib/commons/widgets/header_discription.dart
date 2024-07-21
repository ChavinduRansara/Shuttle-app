import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/container/circular_image.dart';
import 'package:shuttle_app/commons/widgets/loaders/shimmer_loader.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';

class CustomHeaderDiscription extends StatelessWidget {
  const CustomHeaderDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() {
                if (controller.profileLoading.value) {
                  return const ShimmerLoader(
                    width: 80,
                    height: 15,
                  );
                } else {
                  return Text(
                    controller.user.value.name.split(' ').last,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              }),
            ],
          ),
          Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage!.isNotEmpty ? networkImage : AppImages.profile;
            return controller.imageUploadLoading.value
                ? const ShimmerLoader(
                    width: 80,
                    height: 80,
                    radius: 80,
                  )
                : CircularImage(
                    isNetworkImage: networkImage.isNotEmpty,
                    image: image,
                    width: 60,
                    height: 60,
                  );
          }),
        ],
      ),
    );
  }
}
