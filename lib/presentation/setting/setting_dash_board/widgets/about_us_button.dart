part of setting_dash_board;

class AboutUsButton extends StatelessWidget {
  const AboutUsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWellDynamicBorder(
        title: AppLocalizations.of(context)!.about_us,
        leading: const Icon(Icons.help_outline),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => {},
        hasTopBorderRadius: true,
        hasBottomBorderRadius: true,
      ),
    );
  }
}
