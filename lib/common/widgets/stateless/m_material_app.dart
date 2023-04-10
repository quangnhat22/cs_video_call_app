import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/app_theme.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/global_keys.dart';

class MMaterialApp extends StatelessWidget {
  const MMaterialApp(
      {Key? key, this.initialRoute, this.onGenerateRoute, this.homeWidget})
      : super(key: key);

  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final Widget? homeWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'CS Chat App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.lightTheme,
          navigatorKey: AppGlobalKeys.navigatorKey,
          navigatorObservers: [
            AppRoutes.routeObserver,
          ],
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          home: child,
        );
      },
      child: homeWidget,
    );
  }
}
