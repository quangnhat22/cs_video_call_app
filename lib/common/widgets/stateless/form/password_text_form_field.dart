import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final TextEditingController _controller = TextEditingController();
  bool _passwordVisible = false;

  void showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_password;
    }

    if (value.length < 8) {
      return AppLocalizations.of(context)!
          .password_must_be_at_least_8_characters;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: _controller,
        validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: showPassword,
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off)),
          label: Text(AppLocalizations.of(context)!.password_text_field_label),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        obscureText: !_passwordVisible,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
