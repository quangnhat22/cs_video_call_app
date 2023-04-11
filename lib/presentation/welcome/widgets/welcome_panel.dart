part of welcome;

class WelcomePanel extends StatelessWidget {
  const WelcomePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 240.w,
          width: 240.h,
          child: AppAssets.welcomeImage,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
          ),
          child: Text(
            AppLocalizations.of(context)!.get_connect_with_your_friends,
            style: AppTextStyles.headlineTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 0,
          ),
          child: Text(
            AppLocalizations.of(context)!
                .easy_way_to_connect_and_call_video_with_your_friends,
            style: AppTextStyles.captionTextStyle,
          ),
        )
      ],
    );
  }
}
