import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart';

abstract class AppSettingsUseCase {
  Future<void> setAppTheme(String value);
  Future<String> getAppTheme();
  Stream<String?> getAppThemeStream();
  Future<void> setAppLang(String value);
  Future<String> getAppLang();
  Stream<String?> getAppLangStream();
}

@Injectable(as: AppSettingsUseCase)
class AppSettingsUseCaseImpl extends AppSettingsUseCase {
  AppSettingsUseCaseImpl({required this.appSettingsRepo});

  final AppSettingsRepository appSettingsRepo;

  @override
  Future<void> setAppTheme(String value) async {
    return await appSettingsRepo.setAppTheme(value);
  }

  @override
  Future<String> getAppTheme() async {
    return await appSettingsRepo.getAppTheme();
  }

  @override
  Stream<String?> getAppThemeStream() {
    return appSettingsRepo.getThemeStream();
  }

  @override
  Future<void> setAppLang(String value) async {
    return await appSettingsRepo.setAppLanguage(value);
  }

  @override
  Future<String> getAppLang() async {
    return await appSettingsRepo.getAppLanguage();
  }

  @override
  Stream<String?> getAppLangStream() {
    return appSettingsRepo.getLanguageStream();
  }
}
