class AppConfig {
  // late Map<String, dynamic> _config;
  //
  // String get baseUrl => _config[_Config.BASE_URL];
  //
  // AppConfig._() {
  //   _config = _Config.constants;
  // }
  static const baseUrl = 'http://localhost:8080/v1';
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
