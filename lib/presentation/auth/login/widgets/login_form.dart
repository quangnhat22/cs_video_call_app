part of login;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void handleForgotPassword() {
    Navigator.pushNamed(context, RouteName.forgotPasswordPage);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: AppScreenUtils.isLandscape() ? 1.sh : 0.7.sh,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.w,
          horizontal: 20.h,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              const LoginInputEmail(),
              const LoginInputPassword(),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: handleForgotPassword,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.forgot_password,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightColorScheme.primary,
                    ),
                  ),
                ),
              ),
              const LoginButton(),
              if (AppScreenUtils.isLandscape())
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: CustomTextButton(
                      buttonText: AppLocalizations.of(context)!.back_to_welcome,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      foregroundColor: AppColors.lightColorScheme.primary),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
