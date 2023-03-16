import 'package:moving_app/Utils/services/database_service.dart';

class SettingsDataBaseProvider extends DatabaseService {
  SettingsDataBaseProvider(super.prefs);

  bool? getIntroStatus() {
    return prefs.getBool('isIntro');
  }

  Future<void> setIntroStatus(bool isIntro) async {
    await prefs.setBool('isIntro', isIntro);
  }
}
