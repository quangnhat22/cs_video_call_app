part of sign_up;

class VerifiedView extends StatelessWidget {
  const VerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.text_send_email,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.captionTextStyle.copyWith(
                          height: 1.8,
                          fontSize:
                              AppScreenUtils.isLandscape() ? 16.sp : 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtils.isLandscape() ? 100.h : 160.h,
                    ),
                    CustomOutlinedButton(
                      buttonText: AppLocalizations.of(context)!.i_dont_get_it,
                      onPressed: () {},
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                    ),
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
    );
  }
}
