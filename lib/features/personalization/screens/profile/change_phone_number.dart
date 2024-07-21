
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/commons/widgets/profile/update_fields.dart';
import 'package:shuttle_app/features/personalization/controllers/update_phone_number_controller.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/validator/validation.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
    return CutomUpdateDataWidget(
      controller: controller,
      pageName: 'Change Phone Number',
      pageDescription: AppText.numberChangeDescription,
      formKey: controller.updateNumberFormKey,
      onPressed: () {
        controller.updatePhoneNumber();
      },
      previousValue: controller.user.value.phoneNumber,
      field: 'Phone Number',
      children: [
        customInputField(
          context,
          controller: controller.phoneNumber,
          validatorFunction: (value) => AppValidator.validatePhoneNumber(value),
          label: 'New ${AppText.phoneNumber}',
          prefixIcon: Iconsax.call,
        ),
      ],
    );
  }
}

