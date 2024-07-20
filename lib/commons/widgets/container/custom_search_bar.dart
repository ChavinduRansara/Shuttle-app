import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, 
    required this.text, 
    this.icon = Iconsax.search_normal, 
    this.showBackground = true, 
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Container(
        width: AppHelperFunctions.screenWidth(),
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.md),
          border: showBorder ? Border.all(color: AppColor.gray) : null
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColor.darkGray,),
            const SizedBox(width: AppSizes.spaceBtwItems,),
            Text(text, style: const TextStyle(color: AppColor.gray),)
          ],
        ),
      ),
    );
  }
}

