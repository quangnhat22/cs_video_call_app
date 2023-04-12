part of setting_dash_board;

class SettingDashBoardPage extends StatelessWidget {
  const SettingDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(title: AppLocalizations.of(context)!.setting),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
