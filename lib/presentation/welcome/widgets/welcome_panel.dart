part of welcome;

class WelcomePanel extends StatelessWidget {
  const WelcomePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          width: 300,
          child: AppAssets.welcomeImage,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 32.h,
          ),
          child: Text(
            AppLocalizations.of(context)!.get_connect_with_your_friends,
            textAlign: TextAlign.center,
            style: AppTextStyles.headLineLarge
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            AppLocalizations.of(context)!
                .easy_way_to_connect_and_call_video_with_your_friends,
            style: AppTextStyles.labelLarge,
          ),
        )
      ],
    );
  }
}
