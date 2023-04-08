class AppConfig {
  late Map<String, dynamic> _config;

  String get baseUrl => _config[_Config.BASE_URL];

  AppConfig() {
    _config = _Config.constants;
  }
}

class _Config {
  static const BASE_URL = 'BASE_URL';

  static Map<String, dynamic> constants = {
    BASE_URL: 'https://api-dev',
  };
}
