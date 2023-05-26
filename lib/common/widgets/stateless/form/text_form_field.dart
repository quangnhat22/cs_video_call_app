import 'package:flutter/material.dart';

enum InputType { text, phoneNumber, multiline }

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    this.controller,
    required this.icon,
    required this.label,
    this.onChange,
    this.errorText,
    this.type = InputType.text,
    this.isReadOnly = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final Icon icon;
  final String label;
  final InputType type;
  final Function(String)? onChange;
  final String? errorText;
  final VoidCallback? onTap;
  final bool isReadOnly;

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
        onChanged: onChange,
        //validator: (value) => validateValue(value, context),
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          errorText: errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        keyboardType: _checkType(),
        readOnly: isReadOnly,
        onTap: onTap,
      ),
    );
  }
}
