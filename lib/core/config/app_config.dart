import 'dart:io';

class AppConfig {
  // TODO: switch to [10.0.2.2] if using android emulator
  static const httpUrl = '10.0.20.255';
  static final baseUrl = Platform.isAndroid
      ? 'http://$httpUrl:8080/v1'
      : 'http://localhost:8080/v1';
}
