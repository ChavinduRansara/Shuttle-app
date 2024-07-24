import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shuttle_app/commons/widgets/map/generic_map.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  late MapController _mapController;
  LatLng? _currentLocation;
  bool _locationFetched = false;

  static const colomboLatLng = LatLng(6.927079, 79.860017);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _locationFetched = true;
      _mapController.move(_currentLocation!, 13.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    List<Marker> markers = [
      if (_locationFetched)
        const Marker(
          width: 80.0,
          height: 80.0,
          point: colomboLatLng,
          child: Column(
            children: [
              Icon(Iconsax.location, color: Colors.red),
            ],
          ),
        ),
      const Marker(
        width: 80.0,
        height: 80.0,
        point: colomboLatLng,
        child: Column(
          children: [
            Icon(Iconsax.location, color: Colors.blue),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          GenericMapWidget(
            initialCenter: _currentLocation ?? colomboLatLng,
            initialZoom: 13.0,
            markers: markers,
          ),
          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.3,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: dark ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
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
                          Text('Add Waiting Time',
                              style: Theme.of(context).textTheme.labelLarge),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.add_circle),
                            iconSize: 24,
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
