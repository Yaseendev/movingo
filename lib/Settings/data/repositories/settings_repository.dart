import 'package:moving_app/Utils/services/service_locator.dart';

import '../providers/settings_dataBase_provider.dart';

class SettingsRepository {
  late final SettingsDataBaseProvider _databaseProvider;

  SettingsRepository() {
    _databaseProvider = locator.get<SettingsDataBaseProvider>();
  }

  bool checkIsIntro() {
    return _databaseProvider.getIntroStatus() ?? false;
  }

  void skipIntro() => _databaseProvider.setIntroStatus(true);
}
