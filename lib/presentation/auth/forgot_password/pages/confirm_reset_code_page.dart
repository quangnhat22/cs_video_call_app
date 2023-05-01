import 'package:flutter/material.dart';
import 'package:videocall/presentation/auth/forgot_password/pages/new_password_page.dart';

import './reset_code_input.dart';

class ConfirmResetCodePage extends StatelessWidget {
  const ConfirmResetCodePage({super.key});

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10)),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0, 89, 120, 1)),
                                shape: MaterialStateProperty.all(
                                    const CircleBorder())),
                            child: const Icon(Icons.chevron_left),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        )),
                    const Text(
                      'We have just send reset code to',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 30),
                      child: const Text(
                        'trandinhkhoi102@gmail.com',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ResetCodeInput(),
                        ResetCodeInput(),
                        ResetCodeInput(),
                        ResetCodeInput(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Did you receive code?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              ' Please resend',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 89, 120, 1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NewPasswordPage()));
                          },
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
                          child: const Text('CONFIRM'),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
