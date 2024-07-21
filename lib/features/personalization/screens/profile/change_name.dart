
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/commons/widgets/custom_input_field.dart';
import 'package:shuttle_app/commons/widgets/profile/update_fields.dart';
import 'package:shuttle_app/features/personalization/controllers/update_name_controller.dart';
import 'package:shuttle_app/utils/constants/text.dart';
import 'package:shuttle_app/utils/validator/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return CutomUpdateDataWidget(
      controller: controller,
      pageName: 'Change Name',
      pageDescription: AppText.nameChangeDescription,
      formKey: controller.updateNameFormKey,
      onPressed: () {
        controller.updateName();
      },
      previousValue: controller.user.value.name,
      field: 'Name',
      children: [
        customInputField(
          context,
          controller: controller.name,
          validatorFunction: (value) => AppValidator.validateEmpty(value),
          label: 'New ${AppText.name}',
          prefixIcon: Iconsax.user_edit,
        ),
      ],
    );
  }
}

