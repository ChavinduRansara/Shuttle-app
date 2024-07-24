import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/commons/widgets/button/glowing_button.dart';
import 'package:shuttle_app/commons/widgets/container/primary_header_container.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:shuttle_app/features/personalization/screens/map/live_location.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/image_strings.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';
import 'package:shuttle_app/utils/validator/validation.dart';

class BookAService extends StatelessWidget {
  const BookAService({
    super.key,
    required this.routeName,
    required this.location,
  });

  final String routeName;
  final LatLng location;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPrimaryHeaderContainer(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(showBackArrow: true),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            routeName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                        const Image(height: 120, image: AssetImage(AppImages.bus))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  GlowButton(
                    text: 'Shuttle Live Location',
                    onPressed: () {
                      AppHelperFunctions.navigateToScreen(context, LiveLocationScreen( location: location));
                    },
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSectios),
                  const AppSectionHeading(
                    title: AppText.book,
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customInputField(
                          controller: controller.name,
                          validatorFunction: (value) => AppValidator.validateEmpty(value),
                          context,
                          label: 'Pick Up Location',
                          prefixIcon: Iconsax.location5,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        customInputField(
                          controller: controller.name,
                          validatorFunction: (value) => AppValidator.validateEmpty(value),
                          context,
                          label: 'Drop Off Location',
                          prefixIcon: Iconsax.location,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              // Handle the selected date
                            }
                          },
                          child: AbsorbPointer(
                            child: customInputField(
                              controller: controller.name,
                              validatorFunction: (value) => AppValidator.validateEmpty(value),
                              context,
                              label: 'Date',
                              prefixIcon: Iconsax.calendar,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              // Handle the selected time
                            }
                          },
                          child: AbsorbPointer(
                            child: customInputField(
                              controller: controller.name,
                              validatorFunction: (value) => AppValidator.validateEmpty(value),
                              context,
                              label: 'Time',
                              prefixIcon: Iconsax.clock,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Return Trip ?',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Switch(
                              value: true,
                              onChanged: (bool value) {},
                              activeColor: AppColor.primaryColor,
                              activeTrackColor: AppColor.primaryColor.withOpacity(0.5),
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              side: const BorderSide(color: AppColor.primaryColor),
                            ),
                            onPressed: () {
                              // AppHelperFunctions.navigateToScreen(context, const RideScreen());
                            },
                            child: const Text(
                              'Reserve',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

