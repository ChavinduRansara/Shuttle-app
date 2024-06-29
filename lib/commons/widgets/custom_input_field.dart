import 'package:flutter/material.dart';
import 'package:shuttle_app/utils/constants/colors.dart';

Widget customInputField(
  BuildContext context, {
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
}) {
  final focusNode = FocusNode();
  final isFocused = ValueNotifier<bool>(false);
  focusNode.addListener(() {
    isFocused.value = focusNode.hasFocus;
  });

  return ValueListenableBuilder<bool>(
    valueListenable: isFocused,
    builder: (context, isFocusedValue, child) {
      return TextFormField(
        focusNode: focusNode,
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
            borderSide: BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelStyle: TextStyle(
            color: isFocusedValue ? AppColor.primaryColor : null,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: isFocusedValue ? AppColor.primaryColor : null,
                )
              : null,
        ),
      );
    },
  );
}
