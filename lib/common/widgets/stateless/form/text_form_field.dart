import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InputType { text, phoneNumber, multiline }

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    this.type = InputType.text,
  });

  final TextEditingController controller;
  final Icon icon;
  final String label;
  final InputType type;

  String? validateValue(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_email;
    }
    return null;
  }

  TextInputType _checkType() {
    switch (type) {
      case InputType.text:
        return TextInputType.text;
      case InputType.phoneNumber:
        return TextInputType.phone;
      case InputType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        validator: (value) => validateValue(value, context),
        decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        keyboardType: _checkType(),
      ),
    );
  }
}
