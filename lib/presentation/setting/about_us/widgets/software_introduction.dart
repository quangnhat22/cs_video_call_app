part of about_us;

class SoftwareIntroduction extends StatelessWidget {
  const SoftwareIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.our_app,
          style: AppTextStyles.headLineLarge,
        ),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context)!.app_introduction,
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
      ],
    );
  }
}
