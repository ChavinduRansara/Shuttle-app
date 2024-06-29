import 'package:flutter/material.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';

class AppSpacingStyles{
  static const EdgeInsetsGeometry paddingWithAppBar = EdgeInsets.only(
    top: AppSizes.appBarHeight,
    left: AppSizes.defaultSpace,
    right: AppSizes.defaultSpace,
    bottom: AppSizes.defaultSpace,
  );
}