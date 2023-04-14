part of sign_up;

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signUp() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Sign up successfully');
    }
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
            key: _formKey,
            child: Column(children: <Widget>[
              EmailTextFormField(emailController),
              PasswordTextFormField(passwordController),
              ConfirmPasswordTextFormField(
                  confirmPasswordController, passwordController),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      AppLocalizations.of(context)!.sign_up_text_button,
                      signUp,
                      Theme.of(context).colorScheme.secondary),
                ),
              ),
              if (MediaQuery.of(context).orientation == Orientation.landscape)
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: CustomTextButton(
                      AppLocalizations.of(context)!.back_to_welcome, () {
                    Navigator.pop(context);
                  }, Theme.of(context).colorScheme.secondary),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
