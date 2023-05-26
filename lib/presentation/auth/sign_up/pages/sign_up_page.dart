part of sign_up;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpFormCubit>(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpFormCubit, SignUpFormState>(
      listenWhen: (prev, current) => prev != current,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
            context,
            AppLocalizations.of(context)!.action_fail,
            TypesSnackBar.error,
          );
        }
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          SnackBarApp.showSnackBar(
            context,
            AppLocalizations.of(context)!.action_success,
            TypesSnackBar.success,
          );
        }
      },
      child: GestureDetector(
        onTap: () => AppScreenUtils.hideInputKeyboard(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                AuthHeader(
                    AppLocalizations.of(context)!.welcome,
                    AppLocalizations.of(context)!
                        .start_chatting_with_a_new_account,
                    Theme.of(context).colorScheme.secondary),
                const SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
