part of forgot_password;

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void showConfirmPassword() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  void confirmPassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SuccessNotificationPage()));
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }

    if (value != _passwordController.text) {
      return "Confirm password is incorrect";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  SizedBox(width: 250, height: 250, child: AppAssets.iconApp),
                  const Text(
                    'Create new password',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 0),
                            child: TextFormField(
                              validator: validatePassword,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: showPassword,
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                label: const Text('Password (*)'),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_passwordVisible,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 0),
                            child: TextFormField(
                              validator: validateConfirmPassword,
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: showConfirmPassword,
                                    icon: Icon(_confirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                label: const Text('Confirm Password (*)'),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_confirmPasswordVisible,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: confirmPassword,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(0, 89, 120, 1)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        child: const Text('CONFIRM PASSWORD'),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}
