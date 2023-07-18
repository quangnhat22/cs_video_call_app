part of about_us;

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String appVersion = '';
  String appName = '';

  @override
  void initState() {
    _getPackageInfo();
    super.initState();
  }

  void _getPackageInfo() async {
    final name = await DetectDeviceInfo.getPackageName();
    final version = await DetectDeviceInfo.getPackageVersion();
    setState(() {
      appName = name;
      appVersion = version;
    });
  }

  void _openEmailContact(BuildContext ctx) async {
    try {
      await launchUrl(Uri.parse("mailto:${AppConstant.emailContact}"));
    } catch (_) {
      SnackBarApp.showSnackBar(context,
          AppLocalizations.of(ctx)!.open_email_fail, TypesSnackBar.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.about_us,
      ),
      // body: SafeArea(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Padding(
      //       padding: const EdgeInsets.all(12),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: const <Widget>[
      //             SoftwareIntroduction(),
      //             SizedBox(height: 30),
      //             SoftwareDevelopers(),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                radius: CustomAvatarSize.large.width,
                child: AppAssets.iconLightApp,
              ),
              Text(
                appName,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppLocalizations.of(context)!.app_version(appVersion),
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 4,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      height: 1.8,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)!.contact_message,
                      ),
                      TextSpan(
                        text: AppConstant.emailContact,
                        style: AppTextStyles.bodyMedium.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _openEmailContact(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
