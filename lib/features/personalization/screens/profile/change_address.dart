
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/commons/widgets/profile/update_fields.dart';
import 'package:shuttle_app/features/personalization/controllers/update_address_controller.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/validator/validation.dart';

class ChangeAddress extends StatelessWidget {
  const ChangeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateAddressController());
    return CutomUpdateDataWidget(
      controller: controller,
      pageName: 'Change Address',
      pageDescription: AppText.addressChangeDescription,
      formKey: controller.updateAddressFormKey,
      onPressed: () {
        controller.updateaddress();
      },
      previousValue: controller.user.value.address,
      field: 'Address',
      children: [
        customInputField(
          context,
          controller: controller.address,
          validatorFunction: (value) => AppValidator.validateEmpty(value),
          label: 'New Address',
          prefixIcon: Iconsax.direct,
        ),
      ],
    );
  }
}

