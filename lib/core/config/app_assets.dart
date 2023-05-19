import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static var iconApp = Image.asset(
    'assets/logos/logo_light.png',
    fit: BoxFit.cover,
  );

  static final iconLightApp = Image.asset(
    'assets/logos/logo_light.png',
    fit: BoxFit.cover,
  );

  static final loadingGif = Image.asset(
    'assets/gifs/loading.gif',
    height: 256.0,
    width: 256.0,
  );

  static final welcomeImage = Image.asset(
    'assets/images/welcome.png',
    fit: BoxFit.cover,
  );

  static final logoGoogle = Image.asset(
    'assets/images/google.png',
    width: 26,
  );

  static final appLogo = Image.asset(
    'assets/images/logo.png',
    fit: BoxFit.cover,
  );

  static const emptyAvatar = AssetImage(
    'assets/images/empty_avatar.png',
  );

  static final emptyAssetAvatar = Image.asset(
    'assets/images/empty_avatar.png',
    fit: BoxFit.cover,
  );

  static final notFoundSvg = SvgPicture.asset(
    'assets/images/not_found.svg',
    semanticsLabel: 'A red up arrow',
  );
}
