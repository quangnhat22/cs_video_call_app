import 'package:flutter/material.dart';
import 'package:videocall/presentation/auth/login/view/login_page.dart';
import 'package:videocall/presentation/auth/sign_up/pages/sign_up_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset(
                          'assets/images/welcome.png',
                          fit: BoxFit.cover,
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: const Text(
                        'Get Connect with your Friends',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 0),
                      child: const Text(
                        'Easy way to connect and call video with your friends',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: SizedBox(
                        width: isLanscape
                            ? MediaQuery.of(context).size.width * 0.6
                            : double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          icon: const Icon(
                            Icons.mail,
                            size: 26,
                          ),
                          label: const Text('Sign in with email'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 102, 137, 1)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: SizedBox(
                        width: isLanscape
                            ? MediaQuery.of(context).size.width * 0.6
                            : double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google.png',
                            width: 26,
                          ),
                          label: const Text('Sign in with Google'),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.grey[700]),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 0),
                      child: SizedBox(
                        width: isLanscape
                            ? MediaQuery.of(context).size.width * 0.6
                            : double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                            const Text('Or'),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: isLanscape
                          ? MediaQuery.of(context).size.width * 0.6
                          : double.infinity,
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          icon: const Icon(Icons.mail),
                          label: const Text('Sign up with email'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 102, 137, 1)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20)))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
