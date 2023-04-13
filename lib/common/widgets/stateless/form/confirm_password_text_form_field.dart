import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmPasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordTextFormField(
      this.confirmPasswordController, this.passwordController,
      {super.key});

  @override
  State<ConfirmPasswordTextFormField> createState() =>
      _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool _confirmPasswordVisible = false;

  void showPassword() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_confirm_password;
    }

    if (value != widget.passwordController.text) {
      return AppLocalizations.of(context)!.confirm_password_is_incorrect;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.confirmPasswordController,
        validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: showPassword,
              icon: Icon(_confirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off)),
          label: Text(
              AppLocalizations.of(context)!.confirm_password_text_field_label),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        obscureText: !_confirmPasswordVisible,
      ),
    );
  }
}
