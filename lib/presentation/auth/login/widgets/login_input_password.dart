part of login;

class LoginInputPassword extends StatefulWidget {
  const LoginInputPassword({super.key});

  @override
  State<LoginInputPassword> createState() => _LoginInputPasswordState();
}

class _LoginInputPasswordState extends State<LoginInputPassword> {
  bool isVisible = false;

  void _handleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('loginForm_passwordInput_textField'),
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: () => _handleShowPassword(),
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          label: AppLocalizations.of(context)!.password_text_field_label,
          onChange: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          type: InputType.text,
          obscureText: isVisible ? false : true,
          errorText: state.password.displayError != null
              ? state.password.error?.message
              : null,
        );
      },
    );
  }
}
