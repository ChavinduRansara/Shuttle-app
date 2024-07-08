import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/utils/constants/colors.dart';

Widget customInputField(
  BuildContext context, {
  required TextEditingController controller,
  Function? validatorFunction,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
}) {
  final focusNode = FocusNode();
  final isFocused = ValueNotifier<bool>(false);
  final isPasswordVisible = ValueNotifier<bool>(false);
  
  focusNode.addListener(() {
    isFocused.value = focusNode.hasFocus;
  });

  return ValueListenableBuilder<bool>(
    valueListenable: isFocused,
    builder: (context, isFocusedValue, child) {
      return ValueListenableBuilder<bool>(
        valueListenable: isPasswordVisible,
        builder: (context, isPasswordVisibleValue, child) {
          return TextFormField(
            controller: controller,
            validator: validatorFunction as String? Function(String?)?,
            focusNode: focusNode,
            obscureText: suffixIcon != null && !isPasswordVisibleValue,
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: isFocusedValue ? AppColor.primaryColor : null,
              ),
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelStyle: TextStyle(
                color: isFocusedValue ? AppColor.primaryColor : null,
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisibleValue ? Iconsax.eye : Iconsax.eye_slash,
                        color: isFocusedValue ? AppColor.primaryColor : null,
                      ),
                      onPressed: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    )
                  : null,
            ),
          );
        },
      );
    },
  );
}
