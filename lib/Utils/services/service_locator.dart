import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:moving_app/Settings/data/providers/settings_dataBase_provider.dart';
import 'package:moving_app/Settings/data/repositories/settings_repository.dart';
import 'package:moving_app/Shared/Location/data/providers/location_network_provider.dart';
import 'package:moving_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_service.dart';
import 'location_service.dart';

final locator = GetIt.instance;

Future locatorsSetup() async {
  final prefs = await SharedPreferences.getInstance();
  locator..registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton<SettingsDataBaseProvider>(
      () => SettingsDataBaseProvider(prefs));
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<SettingsRepository>(() => SettingsRepository());
  locator.registerLazySingleton<LocationNetworkProvider>(() => LocationNetworkProvider(Dio()));
  locator.registerLazySingleton<LocationRepository>(() => LocationRepository(apiService: locator.get<LocationNetworkProvider>()));
}
