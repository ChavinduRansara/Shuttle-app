import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GenericMapWidget extends StatefulWidget {
  final LatLng initialCenter;
  final double initialZoom;
  final List<Marker> markers;
  final MapController mapController;
  final VoidCallback onMapReady;

  const GenericMapWidget({
    super.key,
    required this.initialCenter,
    required this.initialZoom,
    required this.markers,
    required this.mapController,
    required this.onMapReady,
  });

  @override
  State<GenericMapWidget> createState() => _GenericMapWidgetState();
}

class _GenericMapWidgetState extends State<GenericMapWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        initialCenter: widget.initialCenter,
        initialZoom: widget.initialZoom,
        onMapReady: widget.onMapReady,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: widget.markers,
        ),
      ],
    );
  }
}
