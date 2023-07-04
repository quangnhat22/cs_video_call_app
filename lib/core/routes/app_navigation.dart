import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../utils/global_keys.dart';

class NavigationUtil {
  static NavigatorState? get navigatorKey =>
      AppGlobalKeys.authorNavigatorKey.currentState;

  static Future push({required Widget page}) async {
    return await navigatorKey?.push(MaterialPageRoute(builder: (_) => page));
  }

  static Future pushNamed({required String routeName, Object? args}) async {
    return await navigatorKey?.pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushReplacementNamed(
      {required String routeName, Object? args}) async {
    return await navigatorKey?.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushAndRemoveUntil({required Widget page}) async {
    return await navigatorKey?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
      ),
      (route) => false,
    );
  }

  static Future pushNamedAndRemoveUntil(
      {required String route, Object? args}) async {
    return await navigatorKey?.pushNamedAndRemoveUntil(
      route,
      (r) => false,
      arguments: args,
    );
  }

  static pop({Object? result}) {
    return navigatorKey?.pop(result);
  }

  static loadSingletonPage(
      {required String targetPage, required ReceivedAction receivedAction}) {
    // Avoid to open the notification details page over another details page already opened
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    navigatorKey?.pushNamedAndRemoveUntil(targetPage, (route) {
      return (route.settings.name != targetPage) || route.isFirst;
    }, arguments: {"received-action": receivedAction});
  }
}
