part of schedule_dash_board;

class ScheduleDashBoardPage extends StatelessWidget {
  ScheduleDashBoardPage({Key? key}) : super(key: key);

  final List<Map> inProgressSchedules = [
    {'name': 'Họp làm Figma', 'dateTime': DateTime.now()},
  ];

  final List<Map> upcomingSchedules = [
    {'name': 'Tâm sự cuộc đời', 'dateTime': DateTime.now()},
    {'name': 'Tâm sự cuộc đời 2', 'dateTime': DateTime.now()}
  ];

  final List<Map> todaySchedules = [
    {'name': 'Kể chuyện đêm khuya', 'dateTime': DateTime.now()},
    {'name': 'Kể chuyện đêm khuya 2', 'dateTime': DateTime.now()},
    {'name': 'Kể chuyện đêm khuya 3', 'dateTime': DateTime.now()}
  ];

  final List<Map> yesterdaySchedules = [
    {'name': 'Kể cho nhau nghe', 'dateTime': DateTime.now()},
    {'name': 'Kể cho nhau nghe 2', 'dateTime': DateTime.now()},
    {'name': 'Kể cho nhau nghe 3', 'dateTime': DateTime.now()}
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GlobalSearchBloc>(),
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.schedules,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                if (inProgressSchedules.isNotEmpty)
                  ScheduleInProgress(inProgressSchedules),
                const SizedBox(
                  height: 20,
                ),
                if (upcomingSchedules.isNotEmpty)
                  ScheduleUpcoming(upcomingSchedules),
                const SizedBox(
                  height: 20,
                ),
                if (todaySchedules.isNotEmpty) ScheduleToday(todaySchedules),
                const SizedBox(
                  height: 20,
                ),
                if (yesterdaySchedules.isNotEmpty)
                  ScheduleYesterday(yesterdaySchedules)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionStadiumButton(() {
          NavigationUtil.pushNamed(routeName: RouteName.createSchedule);
        }, null),
      ),
    );
  }
}
