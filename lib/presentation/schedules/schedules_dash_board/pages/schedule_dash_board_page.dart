part of schedule_dash_board;

class ScheduleDashBoardPage extends StatelessWidget {
  const ScheduleDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.schedules,
      ),
      body: const Center(
        child: Text("Schedule"),
      ),
    );
  }
}
