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
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.lightColorScheme.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: AppColors.darkColorScheme.background,
    ),
    // filledButtonTheme: const FilledButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStatePropertyAll(Colors.white),
    //   ),
    // ),
    // elevatedButtonTheme: const ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //   foregroundColor: MaterialStatePropertyAll(Colors.white),
    // )),
    cardTheme: CardTheme(
      elevation: 0,
      surfaceTintColor: AppColors.lightColorScheme.surface,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkColorScheme.background,
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
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white))),
    cardTheme: CardTheme(
      elevation: 1,
      surfaceTintColor: AppColors.darkColorScheme.surface,
    ),
  );
}
