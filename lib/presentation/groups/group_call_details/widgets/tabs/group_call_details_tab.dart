part of group_call_details;

class GroupCallDetailsTab extends StatelessWidget {
  const GroupCallDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Team anh em siêu nhơn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '${DateFormat.Hm().format(DateTime.now())} ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          padding: const EdgeInsets.symmetric(horizontal: 30)),
                      child: Text(
                          AppLocalizations.of(context)!.group_join_text_button),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!
                            .group_response_text_button))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                '${AppLocalizations.of(context)!.group_call_participants_title} (20)',
                style: AppTextStyles.titleMedium,
              ),
            ),
            const GorupCallParticipantList(),
          ],
        ),
      ),
    );
  }
}
