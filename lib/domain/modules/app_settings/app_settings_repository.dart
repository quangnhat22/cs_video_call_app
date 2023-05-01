abstract class AppSettingsRepository {
  Future<void> setAppTheme(String value);
  Future<void> setAppLanguage(String value);
  Future<String> getAppTheme();
  Future<String> getAppLanguage();
  Stream<String?> getThemeStream();
  Stream<String?> getLanguageStream();
}
