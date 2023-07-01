part of forgot_password;

class SuccessNotificationPage extends StatelessWidget {
  const SuccessNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(52, 168, 83, 1),
            ),
            child: Column(children: [
              SizedBox(
                width: 170,
                height: 170,
                child: AppAssets.successImage,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(
                  AppLocalizations.of(context)!.awesome,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(52, 168, 83, 1)),
                ),
              )
            ]),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.reset_password_successfully,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(52, 168, 83, 1)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(0, 108, 69, 1)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        },
                        child:
                            Text(AppLocalizations.of(context)!.back_to_login)),
                  )
                ]),
              ))
        ],
      )),
    );
  }
}
