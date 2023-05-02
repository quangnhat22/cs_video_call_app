class AppConfig {
  // late Map<String, dynamic> _config;
  //
  // String get baseUrl => _config[_Config.BASE_URL];
  //
  // AppConfig._() {
  //   _config = _Config.constants;
  // }

  // TODO: switch to [10.0.2.2] if using android emulator
  static const baseUrl = 'http://10.0.2.2:8080/v1';
}

// class _Config {
//   static const BASE_URL = 'BASE_URL';
//
//   static Map<String, dynamic> constants = {
//     BASE_URL: 'localhost/v1',
//   };
// }

extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

// enum in app
enum AppGender {
  male("Male"),
  female("Female"),
  others("Others");

  const AppGender(this.value);

  final String value;
}

//theme in app
enum AppThemeEnum {
  light("Light"),
  dark("Dark"),
  system("System");

  const AppThemeEnum(this.value);

  final String value;
}

//langue in app
enum AppLangEnum {
  en("English"),
  vi("Vietnamese"),
  system("System");

  const AppLangEnum(this.value);

  final String value;
}
