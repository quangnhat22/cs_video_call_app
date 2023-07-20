import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static var iconApp = Image.asset(
    'assets/logos/logo.png',
    fit: BoxFit.cover,
  );

  static final iconLightApp = Image.asset(
    'assets/logos/logo_light.png',
    fit: BoxFit.cover,
  );

  static final welcomeImage = SvgPicture.asset(
    'assets/images/welcome_image_light.svg',
    fit: BoxFit.cover,
  );

  static final logoGoogle = Image.asset(
    'assets/images/google.png',
    width: 26,
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
    width: 180.w,
    height: 180.h,
  );

  static final successImage = Image.asset(
    'assets/images/success.png',
  );

  static final successIcon = SvgPicture.asset(
    'assets/icons/success.svg',
    width: 120,
    height: 120,
  );

  static final warningIcon = SvgPicture.asset(
    'assets/icons/warning.svg',
    width: 120,
    height: 120,
  );

  static final errorIcon = SvgPicture.asset(
    'assets/icons/error.svg',
    width: 120,
    height: 120,
  );

  static final noDataImg = Image.asset(
    'assets/images/no_data.jpg',
    fit: BoxFit.cover,
  );
}
