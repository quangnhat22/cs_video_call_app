part of schedule_dash_board;

class ScheduleToday extends StatelessWidget {
  const ScheduleToday(this.todaySchedules, {super.key});

  final List<Map> todaySchedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            AppLocalizations.of(context)!.today,
            style: AppTextStyles.titleMedium,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const DividerSpaceLeft(),
          itemBuilder: (context, index) {
            return ScheduleItem(
                todaySchedules[index]['name'],
                todaySchedules[index]['dateTime'],
                Text(
                  AppLocalizations.of(context)!.ended,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold),
                ));
          },
          itemCount: todaySchedules.length,
        )
      ],
    );
  }
}
