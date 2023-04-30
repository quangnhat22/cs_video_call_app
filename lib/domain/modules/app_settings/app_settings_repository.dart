abstract class AppSettingsRepository {
  Future<void> setAppTheme(String value);
  Future<void> setAppLanguage(String value);
  Future<void> getAppTheme();
  Future<void> getAppLanguage();
  Stream<String?> getThemeStream();
  Stream<String?> getLanguageStream();
}
