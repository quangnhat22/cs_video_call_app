part of sign_up;

class InputFullName extends StatelessWidget {
  const InputFullName({super.key});

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      key: const Key('signUpForm_emailInput_textField'),
      icon: const Icon(Icons.email_outlined),
      onChange: (email) =>
          {context.read<SignUpFormCubit>().emailChanged(email)},
      label: AppLocalizations.of(context)!.email_text_field_label,
      // errorText: state.email.displayError != null
      //     ? state.email.error.toString()
      //     : null,
    );
  }
}
