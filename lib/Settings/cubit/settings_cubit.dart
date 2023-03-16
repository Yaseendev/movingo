import 'package:bloc/bloc.dart';
import 'package:moving_app/Settings/data/models/settings.dart';
import 'package:moving_app/Utils/services/service_locator.dart';

import '../data/repositories/settings_repository.dart';

class SettingsCubit extends Cubit<Settings> {
  final SettingsRepository _settingsRepository =
      locator.get<SettingsRepository>();
  SettingsCubit()
      : super(Settings(
            isIntro: locator.get<SettingsRepository>().checkIsIntro()));

  void skipIntro() => _settingsRepository.skipIntro();
}
