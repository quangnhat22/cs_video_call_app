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
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              const LoginInputEmail(),
              const LoginInputPassword(),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: handleForgotPassword,
                  child: Text(
                    AppLocalizations.of(context)!.forgot_password,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              const LoginButton(),
              if (AppScreenUtils.isLandscape())
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: CustomTextButton(
                      AppLocalizations.of(context)!.back_to_welcome, () {
                    Navigator.pop(context);
                  }, Theme.of(context).colorScheme.primary),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
