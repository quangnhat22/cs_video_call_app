part of schedule_dash_board;

class ScheduleYesterday extends StatelessWidget {
  const ScheduleYesterday(this.yesterdaySchedules, {super.key});

  final List<Map> yesterdaySchedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            AppLocalizations.of(context)!.yesterday,
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
                yesterdaySchedules[index]['name'],
                yesterdaySchedules[index]['dateTime'],
                Text(
                  AppLocalizations.of(context)!.ended,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold),
                ));
          },
          itemCount: yesterdaySchedules.length,
        )
      ],
    );
  }
}
