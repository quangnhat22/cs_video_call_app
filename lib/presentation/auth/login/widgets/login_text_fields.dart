part of login;

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      EmailTextFormField(),
      PasswordTextFormField(),
    ]);
  }
}
