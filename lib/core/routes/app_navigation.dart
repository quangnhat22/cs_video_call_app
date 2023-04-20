import 'package:flutter/material.dart';

import '../utils/global_keys.dart';

class NavigationUtil {
  static NavigatorState? get _navigatorKey =>
      AppGlobalKeys.navigatorKey.currentState;

  // static Future push({required Widget page}) async {
  //   return await _navigatorKey?.push(MaterialPageRoute(builder: (_) => page));
  // }

  static Future pushNamed({required String routeName, Object? args}) async {
    return await _navigatorKey?.pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushReplacementNamed(
      {required String routeName, Object? args}) async {
    return await _navigatorKey?.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushAndRemoveUntil({required Widget page}) async {
    return await _navigatorKey?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
      ),
      (route) => false,
    );
  }

  static Future pushNamedAndRemoveUntil(
      {required String route, Object? args}) async {
    return await _navigatorKey?.pushNamedAndRemoveUntil(
      route,
      (r) => false,
      arguments: args,
    );
  }

  static pop({Object? result}) {
    _navigatorKey?.pop(result);
  }
}
