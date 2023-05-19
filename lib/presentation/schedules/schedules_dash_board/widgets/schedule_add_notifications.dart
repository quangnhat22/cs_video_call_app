part of schedule_dash_board;

class ScheduleAddNotifications extends StatelessWidget {
  const ScheduleAddNotifications(
      this.durations, this.onRemove, this.onShowDialog,
      {super.key});

  final List<String> durations;
  final Function onRemove;
  final Function onShowDialog;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const DividerSpaceLeft(),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                  '${AppLocalizations.of(context)!.before} ${durations[index]} ${AppLocalizations.of(context)!.minutes}'),
              leading: Icon(
                Icons.notifications_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () => onRemove(index),
              ),
            ),
            itemCount: durations.length,
          ),
          ListTile(
            title: GestureDetector(
              onTap: () => onShowDialog(context),
              child: Text(
                AppLocalizations.of(context)!.add_notifications,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            leading: const SizedBox(
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
