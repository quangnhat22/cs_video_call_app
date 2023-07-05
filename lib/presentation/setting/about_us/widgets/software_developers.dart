part of about_us;

class SoftwareDevelopers extends StatelessWidget {
  const SoftwareDevelopers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.developers,
          style: AppTextStyles.headlineTextStyle,
        ),
        const SizedBox(height: 12),
        const DeveloperList()
      ],
    );
  }
}
