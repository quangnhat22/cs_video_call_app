part of login;

class LoginInputPassword extends StatelessWidget {
  const LoginInputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('loginForm_passwordInput_textField'),
          icon: const Icon(Icons.lock),
          label: AppLocalizations.of(context)!.password_text_field_label,
          onChange: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          errorText: state.password.displayError != null
              ? state.password.error.toString()
              : null,
        );
      },
    );
  }
}
