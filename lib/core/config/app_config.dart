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

extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
