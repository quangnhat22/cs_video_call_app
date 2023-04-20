import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (_) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            // case AppLoading:
            //   return const MMaterialApp(
            //     homeWidget: WelcomePage(),
            //   );
            case AppUnAuthorized:
              return const MMaterialApp(
                keyMaterialApp: "App_UnAuthorized",
                initialRoute: RouteName.welcomePage,
                onGenerateRoute: AppRoutes.unAuthorizedRoute,
                homeWidget: WelcomePage(),
              );
            default:
              return const MMaterialApp(
                keyMaterialApp: "App_Authorized",
                initialRoute: RouteName.dashboardPage,
                onGenerateRoute: AppRoutes.authorizedRoute,
              );
          }
        },
      ),
    );
  }
}
