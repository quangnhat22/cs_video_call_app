import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:videocall/presentation/dash_board/dash_board.dart';
import 'package:videocall/presentation/friends/friends_dash_board/friends_dash_board.dart';
import 'package:videocall/presentation/friends/friends_infor/friends_infor.dart';
import 'package:videocall/presentation/groups/create_group/create_group.dart';
import 'package:videocall/presentation/groups/group_call_details/group_call_details.dart';
import 'package:videocall/presentation/groups/groups_dash_board/groups_dash_board.dart';
import 'package:videocall/presentation/groups/groups_details/groups_details.dart';
import 'package:videocall/presentation/notifications/notifications_dash_board/notifications_dash_board.dart';
import 'package:videocall/presentation/schedules/schedules_dash_board/schedule_dash_board.dart';
import 'package:videocall/presentation/auth/forgot_password/forgot_password.dart';
import 'package:videocall/presentation/auth/sign_up/sign_up.dart';
import 'package:videocall/presentation/welcome/welcome.dart';
import 'package:videocall/routes/route_name.dart';

import '../presentation/auth/login/login.dart';
import '../presentation/setting/setting_dash_board/setting_dash_board.dart';

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
      case RouteName.forgotPasswordPage:
        return _buildRoute(
          settings,
          const ResetPasswordPage(),
        );
      case RouteName.signUpPage:
        return _buildRoute(settings, const SignUpPage());
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
      case RouteName.friendsInfor:
        return _buildRoute(
          settings,
          const FriendsInforPage(),
        );
      case RouteName.groupsPage:
        return _buildRoute(
          settings,
          const GroupsDashBoardPage(),
        );
      case RouteName.schedulesPage:
        return _buildRoute(
          settings,
          const ScheduleDashBoardPage(),
        );
      case RouteName.notificationsPage:
        return _buildRoute(
          settings,
          const NotificationsDashBoardPage(),
        );
      case RouteName.settingPage:
        return _buildRoute(
          settings,
          const SettingDashBoardPage(),
        );
      case RouteName.teamDetails:
        return _buildRoute(settings, const GroupsDetails());
      case RouteName.teamCallDetails:
        return _buildRoute(settings, const GroupCallDetails());
      case RouteName.createGroup:
        return _buildRoute(settings, const CreateGroupPage());
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
