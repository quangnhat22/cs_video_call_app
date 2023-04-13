import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:videocall/core/config/app_color.dart';

class AppTheme {
  AppTheme._();

  static bool isDarkTheme() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    textTheme: ThemeData.light().textTheme.apply(
        //fontFamily: "Roboto",
        ),
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: AppColors.darkColorScheme.background,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 1,
      surfaceTintColor: AppColors.lightColorScheme.surface,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff1a1d1f),
    useMaterial3: true,
    textTheme: ThemeData.dark().textTheme.apply(
        //fontFamily: "Roboto",
        ),
    colorScheme: AppColors.darkColorScheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.darkColorScheme.background,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 1,
      surfaceTintColor: AppColors.darkColorScheme.surface,
    ),
  );
}
