import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'address.dart';

class LocationResult {
  final LatLng position;
  final Address address;
  final String displayPlace;

  LocationResult({
    required this.position,
    required this.address,
    required this.displayPlace,
  });

  factory LocationResult.fromJson(Map<String, dynamic> responseData) {
    return LocationResult(
      address: Address.fromJson(responseData['address']),
      displayPlace: responseData['display_place'] ?? '',
      position: LatLng(
        double.parse(responseData['lat']),
        double.parse(responseData['lon']),
      ),
    );
  }
}
