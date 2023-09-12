part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, current) => prev != current,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.login_failed_message,
              TypesSnackBar.error);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            AppScreenUtils.hideInputKeyboard();
          },
          child: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                AuthHeader(
                    AppLocalizations.of(context)!.welcome_back,
                    AppLocalizations.of(context)!
                        .sign_in_your_account_to_see_your_chating,
                    AppColors.lightColorScheme.primary),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
