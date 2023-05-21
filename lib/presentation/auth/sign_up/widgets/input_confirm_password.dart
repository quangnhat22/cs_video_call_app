part of sign_up;

class InputConfirmPassword extends StatelessWidget {
  const InputConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChange: (confirmPassword) => context
              .read<SignUpFormCubit>()
              .confirmedPasswordChanged(confirmPassword),
          label:
              AppLocalizations.of(context)!.confirm_password_text_field_label,
          errorText: state.confirmedPassword.displayError != null
              ? state.confirmedPassword.error.toString()
              : null,
        );
      },
    );
  }
}
