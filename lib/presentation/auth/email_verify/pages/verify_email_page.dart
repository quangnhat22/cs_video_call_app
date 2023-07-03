part of email_verify;

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SendEmailCubit>()
        ..pageInited(email)
        ..sendEmail(),
      child: const VerifiedView(),
    );
  }
}

class VerifiedView extends StatelessWidget {
  const VerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendEmailCubit, SendEmailState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.send_email_success,
              TypesSnackBar.success,
            );
          },
          failure: (_, message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
          notVerified: (_) {
            SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.you_didnt_verify,
              TypesSnackBar.warning,
            );
          },
          verified: (_) {
            NavigationUtil.pop(result: true);
          },
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomScrollView(
              physics: const PageScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const ButtonFloatBackToLogin(),
                      SizedBox(
                        width: AppScreenUtils.isLandscape() ? 200.w : 250.w,
                        height: AppScreenUtils.isLandscape() ? 320.h : 250.h,
                        child: AppAssets.iconApp,
                      ),
                      const TextNoticeSentEmail(),
                      SizedBox(height: 80.h),
                      const ButtonResendEmail(),
                      const SizedBox(
                        height: 32,
                      ),
                      const ButttonVerifyReceiveEmail(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonResendEmail extends StatelessWidget {
  const ButtonResendEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      buttonText: AppLocalizations.of(context)!.i_dont_get_it,
      onPressed: () {
        context.read<SendEmailCubit>().sendEmail();
      },
      foregroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
