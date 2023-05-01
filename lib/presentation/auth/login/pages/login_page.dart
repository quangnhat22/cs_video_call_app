part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            AuthHeader(
                AppLocalizations.of(context)!.welcome_back,
                AppLocalizations.of(context)!
                    .sign_in_your_account_to_see_your_chating,
                Theme.of(context).colorScheme.primary),
            const LoginForm()
          ],
        ),
      ),
    );
  }
}
