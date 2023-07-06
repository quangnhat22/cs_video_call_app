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
            // NavigationUtil.pop(result: true);
          },
        );
      },
      child: WillPopScope(
        onWillPop: () async => false,
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
                        //const ButtonFloatBackToLogin(),
                        SizedBox(
                          width: AppScreenUtils.isLandscape() ? 200.w : 250.w,
                          height: AppScreenUtils.isLandscape() ? 320.h : 250.h,
                          child: AppAssets.iconApp,
                        ),
                        const TextNoticeSentEmail(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              ButttonVerifyReceiveEmail(),
                              SizedBox(
                                height: 20,
                              ),
                              ButtonResendEmail(),
                              SizedBox(
                                height: 20,
                              ),
                              VerifyEmailLogoutButton(),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
