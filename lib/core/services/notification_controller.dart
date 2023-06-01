import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';

@Injectable()
class NotificationController {
  static ReceivedAction? initialCallAction;

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
    log(receivedAction.toString(), name: "onReceivedAction");
    if (receivedAction.channelKey == "basic_channel") {
      //TODO: check cal_channel
      await receiveCallNotificationAction(receivedAction);
    }
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString(), name: "onNotificationDisplay");
  }

  static Future<void> receiveCallNotificationAction(
      ReceivedAction receivedAction) async {
    switch (receivedAction.buttonKeyPressed) {
      case 'REJECT':
        // Is not necessary to do anything, because the reject button is
        // already auto dismissible
        break;

      case 'ACCEPT':
        NavigationUtil.loadSingletonPage(
          targetPage: RouteName.callPending,
          receivedAction: receivedAction,
        );
        break;

      default:
        // loadSingletonPage(App.navigatorKey.currentState,
        //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
        break;
    }
  }

// static Future<void> interceptInitialCallActionRequest() async {
//   ReceivedAction? receivedAction =
//       await AwesomeNotifications().getInitialNotificationAction();
//
//   //call_channel
//   if (receivedAction?.channelKey == 'basic_channel') {
//     initialCallAction = receivedAction;
//   }
// }
}
