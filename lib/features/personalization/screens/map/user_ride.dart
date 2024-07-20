import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-6.200000, 106.816666), // Jakarta coordinates
              zoom: 13.0,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('pickup'),
                position: LatLng(-6.200000, 106.816666),
                infoWindow: InfoWindow(title: 'Pick Up Location'),
              ),
              const Marker(
                markerId: MarkerId('dropoff'),
                position: LatLng(-6.300000, 106.816666),
                infoWindow: InfoWindow(title: 'Drop Off Location'),
              ),
            },
          ),
          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.3,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Ride',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.orange),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Pick up location: Moratuwa',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Drop off location: Maradana',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Add a waiting time', style: Theme.of(context).textTheme.labelLarge,),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.add_circle),
                            iconSize: 24, // Adjust the size as needed
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
