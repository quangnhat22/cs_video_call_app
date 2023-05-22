import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class NotificationController {
  Future<void> initializeNotificationsEventListeners() async {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
    );
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Always ensure that all plugins was initialized
    //WidgetsFlutterBinding.ensureInitialized();
    log(receivedAction.toString());
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString());
  }
}
