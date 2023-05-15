part of schedule_dash_board;

class ScheduleUpcoming extends StatelessWidget {
  const ScheduleUpcoming(this.upcomingSchedules, {super.key});

  final List<Map> upcomingSchedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            AppLocalizations.of(context)!.upcoming,
            style: AppTextStyles.mediumTitleTextStyle,
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
                upcomingSchedules[index]['name'],
                upcomingSchedules[index]['dateTime'],
                Text(
                  AppLocalizations.of(context)!.upcoming,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold),
                ));
          },
          itemCount: upcomingSchedules.length,
        )
      ],
    );
  }
}
