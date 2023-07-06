import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NotificationService {
  // Khởi tạo Local Notification ở đây với custom tùy thích
  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'BasicChannel',
              channelDescription:
                  'Notification using for request friend or gr in CS Chat App',
              playSound: true,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          NotificationChannel(
            channelKey: 'call_channel',
            channelName: 'CallChannel',
            channelDescription:
                'Notification using for Call notification in CS Chat App',
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultColor: Colors.blue,
            ledColor: Colors.blue,
          )
        ],
        debug: debug);

    await AwesomeNotifications()
        .requestPermissionToSendNotifications()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  // Hàm này dùng để Khởi tạo Push Notification.
  static Future<void> initializeRemoteNotifications(
      {required bool debug}) async {
    await Firebase.initializeApp();
    await AwesomeNotificationsFcm().initialize(
        // Handle Silent data
        onFcmSilentDataHandle: NotificationService.mySilentDataHandle,
        // Method này dùng để phát hiện khi nhận được fcm token mới.
        onFcmTokenHandle: NotificationService.myFcmTokenHandle,
        // Method này dùng để phát hiện khi nhận được native token mới.
        onNativeTokenHandle: NotificationService.myNativeTokenHandle,
        // Bài sau mình sẽ đi chi tiết hơn về 3 Method trên nhé.

        // This license key is necessary only to remove the watermark for
        // push notifications in release mode. To know more about it, please
        // visit http://awesome-notifications.carda.me#prices
        licenseKeys: null,
        debug: debug);
  }

  // Chỗ này để lấy cái FCM Token của thiết bị nè.
  Future<String> requestFirebaseToken() async {
    if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
      try {
        final token = await AwesomeNotificationsFcm().requestFirebaseAppToken();
        log('==================FCM Token==================');
        log(token);
        log('======================================');
        return token;
      } catch (exception) {
        debugPrint('$exception');
      }
    } else {
      debugPrint('Firebase is not available on this project');
    }
    return '';
  }

  Future<void> checkPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // Hàm gọi Local notification khi nhấn nút Send notification trên ứng dụng
  Future<void> localNotification() async {
    //String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'alerts',
        title: 'This is Notification',
        // Thêm cái hình vào nhìn cho vui mắt :v
        bigPicture:
            'https://images.pexels.com/photos/14679216/pexels-photo-14679216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  /// Use this method to execute on background when a silent data arrives
  /// (even while terminated)
  @pragma("vm:entry-point")
  static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
    log('"SilentData": ${silentData.toString()}');
    if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
      log("bg");
    } else {
      log("FOREGROUND");
    }

    log("starting long task");
    await Future.delayed(const Duration(seconds: 4));
    // final url = Uri.parse("http://google.com");
    // final re = await http.get(url);
    // log(re.body);
    log("long task done");
  }

  Future<String> getFirebaseMessagingToken() async {
    String firebaseAppToken = '';
    if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
      try {
        firebaseAppToken =
            await AwesomeNotificationsFcm().requestFirebaseAppToken();
      } catch (exception) {
        debugPrint('$exception');
      }
    } else {
      debugPrint('Firebase is not available on this project');
    }
    return firebaseAppToken;
  }

  /// Use this method to detect when a new fcm token is received
  @pragma("vm:entry-point")
  static Future<void> myFcmTokenHandle(String token) async {
    log('FCM Token:"$token"');
  }

  /// Use this method to detect when a new native token is received
  @pragma("vm:entry-point")
  static Future<void> myNativeTokenHandle(String token) async {
    log('Native Token:"$token"');
  }
}
