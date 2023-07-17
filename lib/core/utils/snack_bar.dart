import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum TypesSnackBar { success, warning, error }

class SnackBarApp {
  static void showSnackBar(
      BuildContext? context, String? message, TypesSnackBar type) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
        msg: message ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: _showBackgroundSnackBarWithoutContext(type),
        fontSize: 16.0);
    // if (context != null) {
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(SnackBar(
    //       content: Text(message ?? ""),
    //       backgroundColor: _showBackgroundSnackBar(context, type),
    //     ));
    // } else {
    //
    // }
  }

  static void showTopSnackBar(String? message, TypesSnackBar type) {
    Fluttertoast.showToast(
        msg: message ?? '',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: _showBackgroundSnackBarWithoutContext(type),
        fontSize: 16.0);
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

  static Color? _showBackgroundSnackBarWithoutContext(TypesSnackBar type) {
    switch (type) {
      case TypesSnackBar.success:
        return Colors.green;
      case TypesSnackBar.warning:
        return Colors.amberAccent;
      case TypesSnackBar.error:
        return Colors.redAccent;
    }
  }
}
