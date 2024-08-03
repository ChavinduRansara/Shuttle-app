import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/commons/widgets/map/generic_map.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({
    super.key,
    required this.location,
  });

  final LatLng location;

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      Marker(
        width: 80.0,
        height: 80.0,
        point: widget.location,
        child: const Column(
          children: [
            Icon(Iconsax.location, color: Colors.red),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Live Location'),
        showBackArrow: true,
      ),
      body: GenericMapWidget(
        initialCenter: widget.location,
        initialZoom: 13.0,
        markers: markers,
        mapController: _mapController,
        onMapReady: () {
          setState(() {
          });
        },
      ),
    );
  }
}
