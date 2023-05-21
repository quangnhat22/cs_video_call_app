import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CPasswordTextField extends StatefulWidget {
  const CPasswordTextField({
    super.key,
    required this.label,
    this.controller,
    this.onChange,
    this.errorText,
  });

  final TextEditingController? controller;
  final String label;
  final Function(String)? onChange;
  final String? errorText;

  @override
  State<CPasswordTextField> createState() => _CPasswordTextFieldState();
}

class _CPasswordTextFieldState extends State<CPasswordTextField> {
  bool _passwordVisible = false;

  void showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: showPassword,
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          label: Text(AppLocalizations.of(context)!.password_text_field_label),
          errorText: widget.errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        obscureText: !_passwordVisible,
      ),
    );
  }
}
