import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NotificationController {
  // Khởi tạo Local Notification ở đây với custom tùy thích
  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple)
        ],
        debug: debug);
  }

  // Hàm này dùng để Khởi tạo Push Notification.
  static Future<void> initializeRemoteNotifications(
      {required bool debug}) async {
    await Firebase.initializeApp();
    await AwesomeNotificationsFcm().initialize(
        // Handle Silent data
        onFcmSilentDataHandle: NotificationController.mySilentDataHandle,
        // Method này dùng để phát hiện khi nhận được fcm token mới.
        onFcmTokenHandle: NotificationController.myFcmTokenHandle,
        // Method này dùng để phát hiện khi nhận được native token mới.
        onNativeTokenHandle: NotificationController.myNativeTokenHandle,
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
        print('==================FCM Token==================');
        print(token);
        print('======================================');
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
    String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
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
    print('"SilentData": ${silentData.toString()}');

    if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
      print("bg");
    } else {
      print("FOREGROUND");
    }

    print("starting long task");
    await Future.delayed(Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    // final re = await http.get(url);
    // print(re.body);
    print("long task done");
  }

  /// Use this method to detect when a new fcm token is received
  @pragma("vm:entry-point")
  static Future<void> myFcmTokenHandle(String token) async {
    debugPrint('FCM Token:"$token"');
  }

  /// Use this method to detect when a new native token is received
  @pragma("vm:entry-point")
  static Future<void> myNativeTokenHandle(String token) async {
    debugPrint('Native Token:"$token"');
  }
}
