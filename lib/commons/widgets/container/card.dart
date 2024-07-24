import 'package:flutter/material.dart';
import 'package:shuttle_app/commons/widgets/bink_dot.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class ShuttleServiceCard extends StatelessWidget {
  final String serviceName;
  final bool isAvailable;
  final VoidCallback onTap;

  const ShuttleServiceCard({
    super.key,
    required this.serviceName,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      serviceName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isAvailable)
            const Positioned(
              top: 12,
              right: 12,
              child: BlinkingDot(),
            ),
          if (!isAvailable)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: dark ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8.0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Unavailable',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}