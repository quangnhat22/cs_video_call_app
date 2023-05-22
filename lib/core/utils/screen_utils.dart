import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenUtils {
  AppScreenUtils._();

  static bool isLandscape() {
    return ScreenUtil().orientation == Orientation.landscape;
  }

  static void hideInputKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
