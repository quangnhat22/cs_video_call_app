import 'package:flutter/material.dart';

class AppAssets {
  //static const appIcon = AssetsImage('assets/app_icon.png');
  static final welcomeImage = Image.asset(
    'assets/images/welcome.png',
    fit: BoxFit.cover,
  );

  static final logoImage = Image.asset(
    'assets/images/logo.png',
    fit: BoxFit.cover,
  );
}
