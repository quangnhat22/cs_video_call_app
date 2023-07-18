import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class AppCheckPermission {
  AppCheckPermission._();

  static Future<void> checkPermissions() async {
    var status = await Permission.notification.request();

    if (status.isPermanentlyDenied) {
      log('Notification Permission disabled');
    }

    // status = await Permission.bluetooth.request();
    // if (status.isPermanentlyDenied) {
    //   log('Bluetooth Permission disabled');
    // }

    // status = await Permission.bluetoothConnect.request();
    // if (status.isPermanentlyDenied) {
    //   log('Bluetooth Connect Permission disabled');
    // }

    status = await Permission.camera.request();
    if (status.isPermanentlyDenied) {
      log('Camera Permission disabled');
    }

    status = await Permission.microphone.request();
    if (status.isPermanentlyDenied) {
      log('Microphone Permission disabled');
    }
  }
}
