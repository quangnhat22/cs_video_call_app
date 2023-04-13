import 'package:flutter/material.dart';
import 'package:videocall/presentation/auth/forgot_password/forgot_password.dart';
import 'package:videocall/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:videocall/presentation/welcome/welcome.dart';
import 'package:videocall/routes/route_name.dart';

import '../presentation/auth/login/login.dart';

class AppRoutes {
  static final routeObserver = RouteObserver<PageRoute>();

  static Map<String, WidgetBuilder> routes = {};

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
    switch (settings.name) {
      // case '/':
      //   return _buildRoute(
      //     settings,
      //     const WelcomePage(),
      //   );
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
