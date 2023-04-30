import 'package:flutter/material.dart';

class EditThemeView extends StatelessWidget {
  const EditThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EditThemeDialog();
  }
}

class EditThemeDialog extends StatefulWidget {
  const EditThemeDialog({Key? key}) : super(key: key);

  @override
  State<EditThemeDialog> createState() => _EditThemeDialogState();
}

class _EditThemeDialogState extends State<EditThemeDialog> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
