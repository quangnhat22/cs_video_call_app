part of login;

class LoginInputEmail extends StatelessWidget {
  const LoginInputEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('loginForm_emailInput_textField'),
          icon: const Icon(Icons.email_outlined),
          label: AppLocalizations.of(context)!.email_text_field_label,
          onChange: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          errorText: state.email.displayError != null
              ? state.email.error?.message
              : null,
        );
      },
    );
  }
}
