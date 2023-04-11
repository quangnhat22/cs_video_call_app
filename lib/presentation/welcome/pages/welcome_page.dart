part of welcome;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  WelcomePanel(),
                  SizedBox(
                    height: 26,
                  ),
                  WelcomeActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
