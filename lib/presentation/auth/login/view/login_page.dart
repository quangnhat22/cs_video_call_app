import 'package:flutter/material.dart';

import '../../forgot_password/forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  void showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
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
                  const BoxDecoration(color: Color.fromRGBO(0, 89, 120, 1)),
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
                        color: Color.fromRGBO(0, 89, 120, 1),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const Text(
                          'Welcome back',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Sign in your account to see your chating',
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
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 0),
                          child: const TextField(
                            decoration: InputDecoration(
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
                          child: TextField(
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
                        SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPasswordPage()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 89, 120, 1)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 89, 120, 1)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: const Text('SIGN IN'),
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
                                child: const Text('BACK TO WELCOME'),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
