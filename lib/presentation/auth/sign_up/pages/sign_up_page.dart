part of sign_up;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                AppLocalizations.of(context)!.welcome,
                AppLocalizations.of(context)!.start_chatting_with_a_new_account,
                Theme.of(context).colorScheme.secondary),
            const SignUpForm()
          ],
        ),
      ),
    );
  }
}
