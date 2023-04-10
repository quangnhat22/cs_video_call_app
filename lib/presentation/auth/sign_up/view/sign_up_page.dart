import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_config.dart';

import './verified_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final _passwordController = TextEditingController();

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

  void signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VerifiedPage()));
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }

    if (!value.isValidEmail()) {
      return 'Email is invalid';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(123, 106, 193, 1)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(255, 251, 255, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color.fromRGBO(123, 106, 193, 1),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Start chatting with a new account',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
            ),
            Positioned(
              left: 0,
              right: 0,
              // top: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height *
                  (MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1
                      : 0.7),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height *
                    (MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 0.7),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 0),
                          child: TextFormField(
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              label: Text('Email (*)'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 0),
                          child: TextFormField(
                            controller: _passwordController,
                            validator: validatePassword,
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
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: signUp,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(123, 106, 193, 1)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: const Text('SIGN UP'),
                            ),
                          ),
                        ),
                        if (MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                          Container(
                            margin: const EdgeInsets.only(top: 14),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 20))),
                                  child: const Text('BACK TO WELCOME')),
                            ),
                          )
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
