import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart';
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart';

@Injectable(as: AppSettingsRepository)
class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl({required SettingLocalDataSrc localDataSrc})
      : _localDataSrc = localDataSrc;

  final SettingLocalDataSrc _localDataSrc;

  @override
  Future<String> getAppLanguage() async {
    return await _localDataSrc.getLangValue();
  }

  @override
  Future<String> getAppTheme() async {
    return await _localDataSrc.getThemeValue();
  }

  @override
  Future<void> setAppLanguage(String value) {
    return _localDataSrc.setLangLocal(value);
  }

  @override
  Future<void> setAppTheme(String value) {
    return _localDataSrc.setThemeLocal(value);
  }

  @override
  Stream<String?> getThemeStream() {
    return _localDataSrc.getThemeStream();
  }

  @override
  Stream<String?> getLanguageStream() {
    return _localDataSrc.getLangStream();
  }
}
