part of sign_up;

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

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
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                const InputEmail(),
                const InputPassword(),
                const InputConfirmPassword(),
                const ButtonSignUp(),
                if (MediaQuery.of(context).orientation == Orientation.landscape)
                  const ButtonBackToLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
