part of change_password;

class OldPasswordInput extends StatefulWidget {
  const OldPasswordInput({super.key});

  @override
  State<OldPasswordInput> createState() => _OldPasswordInputState();
}

class _OldPasswordInputState extends State<OldPasswordInput> {
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
          previous.oldPassword != current.oldPassword,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('oldPasswordForm_passwordInput_textField'),
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: () => _handleShowPassword(),
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          label: AppLocalizations.of(context)!.old_password_text_field_label,
          onChange: (password) {
            context.read<ChangePasswordCubit>().oldPasswordChanged(password);
          },
          type: InputType.text,
          obscureText: isVisible ? false : true,
          errorText: state.oldPassword.displayError != null
              ? state.oldPassword.error?.message
              : null,
        );
      },
    );
  }
}
