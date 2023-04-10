part of welcome;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  const WelcomePanel(),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                        label: Text(
                            AppLocalizations.of(context)!.sign_in_with_email),
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                        label: Text(
                          AppLocalizations.of(context)!.sign_in_with_google,
                        ),
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 26, horizontal: 0),
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
                          Text(AppLocalizations.of(context)!.or),
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
                        label: Text(
                          AppLocalizations.of(context)!.sign_up_with_email,
                        ),
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
    );
  }
}
