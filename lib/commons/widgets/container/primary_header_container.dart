import 'package:flutter/material.dart';
import 'package:shuttle_app/commons/widgets/container/circular_container.dart';
import 'package:shuttle_app/commons/widgets/container/curve_edge_widget.dart';
import 'package:shuttle_app/utils/constants/colors.dart';

class CustomPrimaryHeaderContainer extends StatelessWidget {
  const CustomPrimaryHeaderContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomCurveEdgeWidget(
      child: Container(
        color: AppColor.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CustomCircularContainer(
                  backgroundColor: AppColor.textWhite.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: 150,
                right: -150,
                child: CustomCircularContainer(
                  backgroundColor: AppColor.textWhite.withOpacity(0.2),
                ),
              ),
              child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}