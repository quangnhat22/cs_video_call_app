part of schedule_dash_board;

class ScheduleInProgress extends StatelessWidget {
  const ScheduleInProgress(this.inProgressSchedules, {super.key});

  final List<Map> inProgressSchedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            AppLocalizations.of(context)!.in_progress,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ScheduleItem(
                inProgressSchedules[index]['name'],
                inProgressSchedules[index]['dateTime'],
                Text(
                  AppLocalizations.of(context)!.in_progress,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.bold),
                ));
          },
          itemCount: inProgressSchedules.length,
        )
      ],
    );
  }
}
