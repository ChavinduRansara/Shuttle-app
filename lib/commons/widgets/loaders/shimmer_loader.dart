import 'package:flutter/material.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width,height,radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark? Colors.grey[800]!: Colors.grey[300]!,
      highlightColor: dark? Colors.grey[700]!: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark? Colors.grey[800]!: Colors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}