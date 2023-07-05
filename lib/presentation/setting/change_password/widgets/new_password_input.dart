part of change_password;

class NewPasswordInput extends StatefulWidget {
  const NewPasswordInput({super.key});

  @override
  State<NewPasswordInput> createState() => _NewPasswordInputState();
}

class _NewPasswordInputState extends State<NewPasswordInput> {
  bool isVisible = false;

  void _handleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('newPasswordForm_passwordInput_textField'),
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: () => _handleShowPassword(),
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          label: AppLocalizations.of(context)!.new_password_text_field_label,
          onChange: (password) {
            context.read<ChangePasswordCubit>().newPasswordChanged(password);
          },
          type: InputType.text,
          obscureText: isVisible ? false : true,
          errorText: state.oldPassword.displayError != null
              ? AppLocalizations.of(context)!.password_is_invalid
              : null,
        );
      },
    );
  }
}
