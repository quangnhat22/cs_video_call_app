part of change_password;

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) =>
          previous.statusSubmit != current.statusSubmit,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!
                  .change_password_successfully_message,
              TypesSnackBar.success);
          NavigationUtil.pop();
        }

        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.old_password_is_incorrect,
              TypesSnackBar.error);
        }
      },
      child: Scaffold(
        appBar: MPageAppBar(
          title: AppLocalizations.of(context)!.change_password,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const OldPasswordInput(),
                    const NewPasswordInput(),
                    const ConfirmNewPasswordInput(),
                    SizedBox(
                      height: 8.h,
                    ),
                    const ChangePasswordButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
