part of about_us;

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.about_us,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  SoftwareIntroduction(),
                  SizedBox(height: 30),
                  SoftwareDevelopers(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
