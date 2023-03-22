import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moving_app/Utils/services/location_service.dart';
import 'package:moving_app/Utils/services/service_locator.dart';
import '../models/address.dart';
import '../models/location_result.dart';
import '../providers/location_network_provider.dart';

class LocationRepository {
  late final LocationNetworkProvider _apiService;
  //late final DatabaseService _databaseService;
  late final LocationService _locationService;

  LocationRepository({
    required LocationNetworkProvider apiService,
    //required DatabaseService? databaseService,
  }) {
    this._apiService = apiService;
    this._locationService = locator.get<LocationService>();
  }

  Future<Position?> getCurrentPosition() async {
    try {
      return await _locationService.determinePosition();
    } catch (e) {
      return null;
    }
  }

  Future<bool> isServiceEnable() async {
    return await _locationService.checkLocationServiceEnabled();
  }

  // Future<bool> openLocationSettings() async =>
  //     await _locationService.openSettings();

  // Future saveLocation(Address location) async =>
  //     await _databaseService.saveLocation(location);

  // Future setCurrentLocation(Address location) async =>
  //     await _databaseService.setCurrentLocation(location);

  // Address? getCurrentLocation() =>
  //     _databaseService.getCurrentLocation();

  // Future<List<Address>> getSavedLocations() async {
  //   return await _databaseService.getSavedLocations();
  // }

  Future<List<LocationResult>> getLoactionSearchResult(String text) async {
    //if (text.isEmpty) return null;
    List<dynamic> result = await _apiService.searchLocation(text);
    return result.map((e) => LocationResult.fromJson(e)).toList();
  }

  Future<Address?> getReversedGeoCode(LatLng position, [CancelToken? cToken]) async {
    final result = await _apiService.reverseGeoLocation(position, cToken);
    return
        result != null
            ? Address.fromJson(result).copyWith(location: position)
            : null;
  }
}
