import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/buttons/custom_elevated_button.dart';
import 'package:videocall/core/config/app_text_styles.dart';

import '../../../../core/config/app_assets.dart';
import '../buttons/custom_text_button.dart';

part 'app_dialog_default_widget.dart';

// part 'app_dialog_screen_widget.dart';

enum AppDialogType {
  success(type: 'success'),
  error(type: 'error'),
  confirm(type: 'confirm');

  final String type;
  const AppDialogType({required this.type});
}

abstract class AppDialogBaseBuilder {
  @protected
  Dialog? _dialog;
  @protected
  String? _title;
  @protected
  String? _content;
  @protected
  String? _positiveText;
  @protected
  String? _negativeText;
  @protected
  Widget? _icon;
  @protected
  AppDialogType? _appDialogType;
  @protected
  void Function()? _onPositive;
  @protected
  void Function()? _onNegative;

  AppDialogBaseBuilder setTitle(String? title) {
    return this;
  }

  AppDialogBaseBuilder setContent(String? content) {
    return this;
  }

  AppDialogBaseBuilder setPositiveText(String? positiveText) {
    return this;
  }

  AppDialogBaseBuilder setNegativeText(String? negativeText) {
    return this;
  }

  AppDialogBaseBuilder setIcon(Widget? icon) {
    return this;
  }

  AppDialogBaseBuilder setAppDialogType(AppDialogType? type) {
    return this;
  }

  AppDialogBaseBuilder setOnPositive(void Function()? onPositive) {
    return this;
  }

  AppDialogBaseBuilder setOnNegative(void Function()? onNegative) {
    return this;
  }

  AppDialogBaseBuilder buildDialog(BuildContext context);

  void show(BuildContext context) {
    showDialog(context: context, builder: (context) => _dialog!);
  }
}
