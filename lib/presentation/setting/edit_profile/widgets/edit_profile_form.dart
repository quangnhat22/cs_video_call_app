import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../../common/widgets/stateless/buttons/custom_text_button.dart';
import '../../../../common/widgets/stateless/form/confirm_password_text_form_field.dart';
import '../../../../common/widgets/stateless/form/email_text_form_field.dart';
import '../../../../common/widgets/stateless/form/password_text_form_field.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    void signUp() {
      if (_formKey.currentState!.validate()) {
        debugPrint('Sign up successfully');
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          EmailTextFormField(emailController),
          PasswordTextFormField(passwordController),
          ConfirmPasswordTextFormField(
              confirmPasswordController, passwordController),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  AppLocalizations.of(context)!.sign_up_text_button,
                  signUp,
                  Theme
                      .of(context)
                      .colorScheme
                      .secondary),
            ),
          ),
          if (MediaQuery
              .of(context)
              .orientation == Orientation.landscape)
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: CustomTextButton(
                AppLocalizations.of(context)!.back_to_welcome,
                    () {
                  Navigator.pop(context);
                },
                Theme
                    .of(context)
                    .colorScheme
                    .secondary,
              ),
            )
        ]),
      ),
    );
  }
}
