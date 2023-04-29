import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/birthday_input.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/gender_input.dart';

import '../../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../../common/widgets/stateless/buttons/custom_text_button.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final fullNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    void signUp() {
      if (formKey.currentState!.validate()) {
        debugPrint('Sign up successfully');
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(children: <Widget>[
          CTextFormField(
            controller: usernameController,
            icon: const Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.username,
          ),
          CTextFormField(
            controller: fullNameController,
            icon: const Icon(Icons.badge_outlined),
            label: AppLocalizations.of(context)!.full_name,
            type: InputType.text,
          ),
          CTextFormField(
            controller: phoneNumberController,
            icon: const Icon(Icons.phone_outlined),
            label: AppLocalizations.of(context)!.phone_number,
            type: InputType.phoneNumber,
          ),
          const BirthdayInput(),
          const GenderInput(),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  AppLocalizations.of(context)!.sign_up_text_button,
                  signUp,
                  Theme.of(context).colorScheme.secondary),
            ),
          ),
          if (MediaQuery.of(context).orientation == Orientation.landscape)
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: CustomTextButton(
                AppLocalizations.of(context)!.back_to_welcome,
                () {
                  Navigator.pop(context);
                },
                Theme.of(context).colorScheme.secondary,
              ),
            )
        ]),
      ),
    );
  }
}
