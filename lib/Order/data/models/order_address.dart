import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderAddress {
  final LatLng position;
  final String name;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String otherDetails;
  final String phoneNumber;

  OrderAddress({
    required this.position,
    required this.name,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
     this.otherDetails = '',
    required this.phoneNumber,
  });

  OrderAddress copyWith({
    LatLng? position,
    String? name,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? otherDetails,
    String? phoneNumber,
  }) {
    return OrderAddress(
      position: position ?? this.position,
      name: name ?? this.name,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      otherDetails: otherDetails ?? this.otherDetails,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
