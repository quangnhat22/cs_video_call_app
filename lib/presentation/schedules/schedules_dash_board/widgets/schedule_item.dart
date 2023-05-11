part of schedule_dash_board;

class ScheduleItem extends StatelessWidget {
  const ScheduleItem(this.groupName, this.dateTime, this.status, {super.key});

  final String groupName;
  final DateTime dateTime;
  final Widget status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        groupName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
          '${DateFormat.Hm().format(dateTime)} ${DateFormat.yMMMMd().format(dateTime)}'),
      leading: const CircleAvatar(child: Text('A')),
      trailing: status,
    );
  }
}
