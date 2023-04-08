import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    textTheme: ThemeData.light().textTheme.apply(
        //fontFamily: "Roboto",
        ),
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff1a1d1f),
    useMaterial3: true,
    textTheme: ThemeData.dark().textTheme.apply(
        //fontFamily: "Roboto",
        ),
    colorScheme: AppColors.darkColorScheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
  );
}
