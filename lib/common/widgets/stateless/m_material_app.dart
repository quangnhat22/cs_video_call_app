import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/config/app_theme.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/global_keys.dart';

class MMaterialApp extends StatelessWidget {
  const MMaterialApp({
    Key? key,
    required this.initialRoute,
    this.onGenerateRoute,
  }) : super(key: key);

  final String initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  @override
  MaterialApp build(BuildContext context) {
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
    );
  }
}
