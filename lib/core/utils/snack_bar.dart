import 'package:flutter/material.dart';

enum TypesSnackBar { success, warning, error }

class SnackBarApp {
  static void showSnackBar(
      BuildContext context, String? message, TypesSnackBar type) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ?? ""),
      backgroundColor: _showBackgroundSnackBar(context, type),
    ));
  }

  static Color? _showBackgroundSnackBar(
      BuildContext context, TypesSnackBar type) {
    switch (type) {
      case TypesSnackBar.success:
        return Theme.of(context).colorScheme.tertiary;
      case TypesSnackBar.warning:
        return Colors.amber;
      case TypesSnackBar.error:
        return Theme.of(context).colorScheme.error;
    }
  }
}
