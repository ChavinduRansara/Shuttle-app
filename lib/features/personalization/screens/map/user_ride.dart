import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shuttle_app/commons/widgets/map/generic_map.dart';
import 'package:shuttle_app/utils/constants/colors.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  late MapController _mapController;
  LatLng? _currentLocation;
  bool _locationFetched = false;
  bool _isLoading = false;
  bool _mapReady = false;

  static const colomboLatLng = LatLng(6.927079, 79.860017);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Location Services Disabled'),
                content: const Text('Please enable Location Services in your device settings.'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Location Permissions Denied'),
                  content: const Text('Please grant location permissions to use this feature.'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Location Permissions Permanently Denied'),
                content: const Text('Location permissions are permanently denied, we cannot request permissions.'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (mounted) {
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _locationFetched = true;
          _isLoading = false;
          if (_mapReady) {
            _mapController.move(_currentLocation!, 13.0);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('An error occurred while fetching your location. Please try again later.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    List<Marker> markers = [
      if (_isLoading)
        const Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(0, 0), // Placeholder coordinates
          child: CircularProgressIndicator(),
        ),
      if (_locationFetched)
        Marker(
          width: 80.0,
          height: 80.0,
          point: _currentLocation!,
          child: const Column(
            children: [
              Icon(Iconsax.location, color: Colors.red),
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
            mapController: _mapController,
            onMapReady: () {
              setState(() {
                _mapReady = true;
                if (_currentLocation != null) {
                  _mapController.move(_currentLocation!, 13.0);
                }
              });
            },
          ),
          // Full screen loader
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                ),
              ),
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
