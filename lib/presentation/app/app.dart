import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/global_keys.dart';
import 'package:videocall/presentation/dash_board/dash_board.dart';
import 'package:videocall/presentation/loading/loading_page.dart';
import 'package:videocall/presentation/welcome/welcome.dart';

import '../../common/widgets/stateless/m_material_app.dart';
import '../../core/routes/app_routes.dart';
import '../../core/routes/route_name.dart';
import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (prev, current) => prev != current,
        builder: (context, state) {
          switch (state.runtimeType) {
            case AppUnAuthorized:
              {
                return const MMaterialApp(
                  keyMaterialApp: "App_UnAuthorized",
                  initialRoute: RouteName.welcomePage,
                  onGenerateRoute: AppRoutes.unAuthorizedRoute,
                  homeWidget: WelcomePage(),
                );
              }
            case AppAuthorized:
              {
                log("here");
                return MMaterialApp(
                  keyMaterialApp: "App_Authorized",
                  initialRoute: RouteName.dashboardPage,
                  onGenerateRoute: AppRoutes.authorizedRoute,
                  navigatorKey: AppGlobalKeys.authorNavigatorKey,
                  homeWidget: const DashboardPage(),
                );
              }
            default:
              {
                return const MMaterialApp(
                  keyMaterialApp: "App_Loading",
                  initialRoute: "/",
                  onGenerateRoute: AppRoutes.loadingRoute,
                  homeWidget: LoadingPage(),
                );
              }
          }
        },
      ),
    );
  }
}
