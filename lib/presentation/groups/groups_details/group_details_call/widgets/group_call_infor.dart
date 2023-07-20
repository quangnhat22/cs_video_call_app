part of group_details_call;

class GroupCallInfor extends StatelessWidget {
  const GroupCallInfor(
      {super.key,
      required this.title,
      required this.startAt,
      this.description});

  final String? title;
  final String? description;
  final DateTime? startAt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title ?? '',
            style: AppTextStyles.headLineMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
              style: AppTextStyles.bodyLarge,
              AppLocalizations.of(context)!.started_at(
                AppDateTimeFormat.formatDMYHHmm(startAt),
              )),
          if (description != null)
            Text(
              style: AppTextStyles.bodyLarge,
              description ?? '',
            ),
        ],
      ),
    );
  }
}
