import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  late final SharedPreferences prefs;
  DatabaseService(this.prefs, [this.secureStorage = const FlutterSecureStorage()]);
}
