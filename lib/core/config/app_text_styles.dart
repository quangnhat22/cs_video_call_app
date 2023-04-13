import 'package:flutter/material.dart';

import 'app_font_size.dart';

class AppTextStyles {
  // static const TextStyle normalTextStyle = TextStyle(
  //   color: Colors.black,
  //   fontSize: AppFontSize.normalFontSize,
  // );

  // static const TextStyle pinkBoldStyle = TextStyle(
  //   color: AppColor.primaryColor,
  //   fontWeight: FontWeight.bold,
  // );

  static const TextStyle headlineTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSize.headlineFontSize,
  );

  static const TextStyle mediumTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle captionTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  //app bar
  static const TextStyle titleAppBarTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
  );

  static const TextStyle authHeadTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.headlineFontSize,
      color: Colors.white);

  static const TextStyle authHeadSubtitleTextStyle =
      TextStyle(fontSize: AppFontSize.normalFontSize, color: Colors.white);

  // static const TextStyle normalItalicPrimaryTextStyle = TextStyle(
  //   color: AppColor.primaryColor,
  //   fontStyle: FontStyle.italic,
  // );
}
