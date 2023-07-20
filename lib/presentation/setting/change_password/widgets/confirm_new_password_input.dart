part of change_password;

class ConfirmNewPasswordInput extends StatefulWidget {
  const ConfirmNewPasswordInput({super.key});

  @override
  State<ConfirmNewPasswordInput> createState() =>
      _ConfirmNewPasswordInputState();
}

class _ConfirmNewPasswordInputState extends State<ConfirmNewPasswordInput> {
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
          previous.newPassword != current.newPassword ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return CTextFormField(
          key: const Key('confirmNewPasswordForm_passwordInput_textField'),
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: () => _handleShowPassword(),
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          label:
              AppLocalizations.of(context)!.confirm_password_text_field_label,
          onChange: (password) {
            context
                .read<ChangePasswordCubit>()
                .confirmPasswordChanged(password);
          },
          type: InputType.text,
          obscureText: isVisible ? false : true,
          errorText: state.confirmPassword.displayError != null
              ? state.confirmPassword.error?.message
              : null,
        );
      },
    );
  }
}
