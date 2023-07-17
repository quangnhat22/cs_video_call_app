import 'package:flutter/material.dart';

class _AppFontHeight {
  static const double h11_16 = 16 / 11;
  static const double h12_16 = 16 / 12;
  static const double h14_20 = 20 / 14;
  static const double h16_24 = 24 / 16;
  static const double h22_28 = 28 / 22;
  static const double h24_32 = 32 / 24;
  static const double h28_36 = 36 / 28;
  static const double h32_40 = 40 / 32;
  static const double h36_44 = 44 / 36;
  static const double h45_52 = 52 / 45;
  static const double h57_64 = 64 / 57;
}

class _AppFontSize {
  static const double t11 = 11;
  static const double t12 = 12;
  static const double t14 = 14;
  static const double t16 = 16;
  static const double t22 = 22;
  static const double t24 = 24;
  static const double t28 = 28;
  static const double t32 = 32;
  static const double t36 = 36;
  static const double t45 = 45;
  static const double t57 = 57;
}

class AppTextStyles {
  AppTextStyles._();

  //Display
  static const TextStyle displayLarge = TextStyle(
    fontSize: _AppFontSize.t57,
    height: _AppFontHeight.h57_64,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: _AppFontSize.t45,
    height: _AppFontHeight.h45_52,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: _AppFontSize.t36,
    height: _AppFontHeight.h36_44,
  );

  //Headline
  static const TextStyle headLineLarge = TextStyle(
    fontSize: _AppFontSize.t32,
    height: _AppFontHeight.h32_40,
  );
  static const TextStyle headLineMedium = TextStyle(
    fontSize: _AppFontSize.t28,
    height: _AppFontHeight.h28_36,
  );
  static const TextStyle headLineSmall = TextStyle(
    fontSize: _AppFontSize.t24,
    height: _AppFontHeight.h24_32,
  );

  //Title
  static const TextStyle titleLarge = TextStyle(
    fontSize: _AppFontSize.t22,
    height: _AppFontHeight.h22_28,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: _AppFontSize.t16,
    height: _AppFontHeight.h16_24,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: _AppFontSize.t14,
    height: _AppFontHeight.h14_20,
  );

  //Label
  static const TextStyle labelLarge = TextStyle(
    fontSize: _AppFontSize.t14,
    height: _AppFontHeight.h14_20,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: _AppFontSize.t12,
    height: _AppFontHeight.h12_16,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: _AppFontSize.t11,
    height: _AppFontHeight.h11_16,
  );

  //body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: _AppFontSize.t16,
    height: _AppFontHeight.h16_24,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: _AppFontSize.t14,
    height: _AppFontHeight.h14_20,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: _AppFontSize.t12,
    height: _AppFontHeight.h12_16,
  );
}
