import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                  overflow: TextOverflow.visible, // Handle overflow with ellipsis
                  softWrap: true,
                ),
              ),
              Container(
                width: 110, 
                decoration: BoxDecoration(
                  color: isAvailable ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  isAvailable ? 'Available' : 'Unavailable',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}