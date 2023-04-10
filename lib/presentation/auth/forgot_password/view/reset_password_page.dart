import 'package:flutter/material.dart';
import './confirm_reset_code_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
                      'Forgot password?',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 28),
                      child: const Text(
                        'Enter you registered email below to receive password reset instruction',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: const TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            label: Text('Email (*)'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConfirmResetCodePage()));
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
                          child: const Text('SEND EMAIL'),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
