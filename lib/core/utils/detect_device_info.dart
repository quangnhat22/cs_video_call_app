import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DetectDeviceInfo {
  static Future<String> getDeviceName() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    String? deviceName;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceName = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceName = iosInfo.utsname.machine;
    }
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceName = webBrowserInfo.userAgent;
    }
    return deviceName ?? "undefined";
  }

  static Future<String> getPackageVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;
    //final buildNumber = packageInfo.buildNumber;
    return appVersion;
  }

  static Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appName = packageInfo.appName;
    return appName;
  }
}
