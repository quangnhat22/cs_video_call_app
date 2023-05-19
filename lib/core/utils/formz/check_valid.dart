import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TypeValueCheck { email, password, confirmedPassword, text, none }

class AppCheckValid {
  AppCheckValid._();

  static String? checkValid(
      String? value, TypeValueCheck type, BuildContext ctx) {
    if (value == null || value == "" || value.isEmpty) {
      switch (type) {
        case TypeValueCheck.email:
          return AppLocalizations.of(ctx)!.please_enter_email;
        case TypeValueCheck.password:
          return AppLocalizations.of(ctx)!.please_enter_password;
        case TypeValueCheck.confirmedPassword:
          return AppLocalizations.of(ctx)!.please_enter_confirm_password;
        case TypeValueCheck.text:
          return AppLocalizations.of(ctx)!.please_not_empty;
        case TypeValueCheck.none:
          null;
      }
    }
    return null;
  }
}
