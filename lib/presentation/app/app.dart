import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/global_keys.dart';
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart';
import 'package:videocall/presentation/app/network_bloc/network_bloc.dart';
import 'package:videocall/presentation/app/notification_cubit/app_notification_cubit.dart';
import 'package:videocall/presentation/dash_board/dash_board.dart';
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart';
import 'package:videocall/presentation/notifications/loading/loading_page.dart';
import 'package:videocall/presentation/welcome/welcome.dart';

import '../../common/widgets/stateless/m_material_app.dart';
import '../../core/routes/app_routes.dart';
import '../../core/routes/route_name.dart';
import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return getIt<AppBloc>()
              ..add(AppStarted())
              ..add(AppUserChanged());
          },
        ),
        BlocProvider(
          create: (context) => getIt<AppSettingCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AppNotificationCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<GlobalSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<NetworkBloc>(),
        )
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, AppState appState) {
          return BlocBuilder<AppSettingCubit, AppSettingState>(
            builder: (context, AppSettingState appSettingState) {
              switch (appState.runtimeType) {
                case AppUnAuthorized:
                  {
                    return MMaterialApp(
                      keyMaterialApp: "App_UnAuthorized",
                      initialRoute: RouteName.welcomePage,
                      onGenerateRoute: AppRoutes.unAuthorizedRoute,
                      homeWidget: const WelcomePage(),
                      locale: appSettingState.locale,
                      themeMode: appSettingState.theme,
                    );
                  }
                case AppAuthorized:
                  {
                    return MMaterialApp(
                      keyMaterialApp: "App_Authorized",
                      initialRoute: RouteName.dashboard,
                      onGenerateRoute: AppRoutes.authorizedRoute,
                      navigatorKey: AppGlobalKeys.authorNavigatorKey,
                      homeWidget: const DashboardPage(),
                      locale: appSettingState.locale,
                      themeMode: appSettingState.theme,
                    );
                  }
                default:
                  {
                    return MMaterialApp(
                      keyMaterialApp: "App_Loading",
                      initialRoute: "/",
                      onGenerateRoute: AppRoutes.loadingRoute,
                      homeWidget: const LoadingPage(),
                      locale: appSettingState.locale,
                      themeMode: appSettingState.theme,
                    );
                  }
              }
            },
          );
        },
      ),
    );
  }
}
