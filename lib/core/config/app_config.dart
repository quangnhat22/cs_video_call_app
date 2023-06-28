import 'dart:io';

class AppConfig {
  // TODO: switch to [10.0.2.2] if using android emulator
  static final baseUrl = Platform.isAndroid
      ? 'http://192.168.3.227:8080/v1'
      : 'http://localhost:8080/v1';
}
