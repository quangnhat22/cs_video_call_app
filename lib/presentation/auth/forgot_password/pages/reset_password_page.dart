part of forgot_password;

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: const ResetPasswordView(),
    );
  }
}

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.failed_to_send_email,
              TypesSnackBar.error);
        }
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          AppDefaultDialogWidget()
              .setAppDialogType(AppDialogType.success)
              .setTitle(AppLocalizations.of(context)!.send_email_success)
              .setContent(AppLocalizations.of(context)!
                  .check_email_forgot_password(state.email.value))
              .setPositiveText(AppLocalizations.of(context)!.open_gmail_app)
              .setOnPositive(() async {
                await LaunchApp.openApp(
                  androidPackageName: 'com.google.android.gm',
                  iosUrlScheme: 'googlegmail://',
                  // appStoreLink:
                  // 'itms-apps://itunes.apple.com/app/pulse-secure/id945832041',
                  openStore: true,
                  // https://apps.apple.com/us/app/gmail-email-by-google/id422689480
                );
              })
              .buildDialog(context)
              .show(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: FloatBackButton(
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.onPrimary),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 250, height: 250, child: AppAssets.iconApp),
                      Text(
                        AppLocalizations.of(context)!.forgot_password,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 28),
                        child: Text(
                          AppLocalizations.of(context)!
                              .enter_you_registered_email_below_to_receive_password_reset_instruction,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SendEmailForm(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
