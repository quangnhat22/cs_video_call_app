import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:videocall/presentation/dash_board/dash_board.dart';
import 'package:videocall/presentation/friends/friends_dash_board/friends_dash_board.dart';
import 'package:videocall/presentation/groups/groups_dash_board/groups_dash_board.dart';
import 'package:videocall/presentation/notifications/notifications.dart';
import 'package:videocall/presentation/schedules/schedule_dash_board.dart';
import 'package:videocall/presentation/setting/setting.dart';
import 'package:videocall/presentation/welcome/welcome.dart';
import 'package:videocall/routes/route_name.dart';

import '../presentation/auth/login/view/login_page.dart';

class AppRoutes {
  static final routeObserver = RouteObserver<PageRoute>();

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomePage:
        return _buildRoute(
          settings,
          const WelcomePage(),
        );
      case RouteName.loginPage:
        return _buildRoute(
          settings,
          const LoginPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route authorizedRoute(RouteSettings settings) {
    log(settings.name.toString());
    switch (settings.name) {
      case RouteName.dashboardPage:
        return _buildRoute(
          settings,
          const DashboardPage(),
        );
      case RouteName.friendsPage:
        return _buildRoute(
          settings,
          const FriendsDashBoardPage(),
        );
      case RouteName.groupsPage:
        return _buildRoute(
          settings,
          const GroupsDashBoardPage(),
        );
      case RouteName.schedulesPage:
        return _buildRoute(
          settings,
          const SchedulePage(),
        );
      case RouteName.notificationsPage:
        return _buildRoute(
          settings,
          const NotificationsPage(),
        );
      case RouteName.settingPage:
        return _buildRoute(
          settings,
          const SettingPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
