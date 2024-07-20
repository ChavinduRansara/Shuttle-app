import 'package:flutter/material.dart';
import 'package:shuttle_app/commons/widgets/curved_edges.dart';

class CustomCurveEdgeWidget extends StatelessWidget {
  const CustomCurveEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
