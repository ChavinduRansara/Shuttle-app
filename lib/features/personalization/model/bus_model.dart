import 'package:cloud_firestore/cloud_firestore.dart';

class BusModel {
  final String busId;
  String routeName;
  bool isAvailable;
  GeoPoint location;

  BusModel({
    required this.busId,
    required this.routeName,
    required this.isAvailable,
    required this.location,
  });
   
  static BusModel empty() => BusModel(
    busId: '',
    routeName: '',
    isAvailable: false,
    location: const GeoPoint(0.0, 0.0),
  );
  
  factory BusModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;
      return BusModel(
        busId: document.id,
        routeName: data['routeName'] ?? '',
        isAvailable: data['isAvailable'] ?? false,
        location: data['location'] ?? const GeoPoint(0.0, 0.0),
      );
    }else{
      return BusModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'busId': busId,
      'routeName': routeName,
      'isAvailable': isAvailable,
      'location': location,
    };
  }


}