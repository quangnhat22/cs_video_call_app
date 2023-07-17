part of email_verify;

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SendEmailCubit>()..pageInited(email),
        ),
        BlocProvider(
          create: (_) => getIt<IsSentEmailCubit>(),
        ),
      ],
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
              null,
              AppLocalizations.of(context)!.send_email_success,
              TypesSnackBar.success,
            );
          },
          failure: (_, message) {
            SnackBarApp.showSnackBar(null, message, TypesSnackBar.error);
          },
          notVerified: (_) {
            SnackBarApp.showSnackBar(
              null,
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextNoticeSentEmail(),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              ColumnButtonAction(),
                              SizedBox(
                                height: 4,
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
