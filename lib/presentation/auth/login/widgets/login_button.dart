part of login;

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  void handleLogin(BuildContext ctx) {
    ctx.read<LoginCubit>().loginFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 60),
          child: CustomElevatedButton(
            AppLocalizations.of(context)!.sign_in_text_button,
            state.isValid ? () => handleLogin(context) : null,
            state.isValid
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[400]!,
          ),
        );
      },
    );
  }
}
