part of sign_up;

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('signUpForm_passwordInput_textField'),
          label: AppLocalizations.of(context)!.password_text_field_label,
          onChange: (password) =>
              context.read<SignUpFormCubit>().passwordChanged(password),
          errorText: state.password.displayError != null
              ? state.password.error?.message
              : null,
        );
      },
    );
  }
}
