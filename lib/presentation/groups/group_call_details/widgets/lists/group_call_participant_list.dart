part of group_call_details;

class GorupCallParticipantList extends StatelessWidget {
  const GorupCallParticipantList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
              title: const Text('Nguyễn Văn A'),
              leading: const CircleAvatar(
                child: Text('A'),
              ),
              trailing: index % 2 == 0
                  ? SizedBox(
                      width: 100.w,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        child:
                            Text(AppLocalizations.of(context)!.accept_request),
                      ),
                    )
                  : index == 3
                      ? SizedBox(
                          width: 100.w,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.error,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.error)),
                            child: Text(
                                AppLocalizations.of(context)!.reject_request),
                          ),
                        )
                      : SizedBox(
                          width: 100.w,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: const BorderSide(color: Colors.orange)),
                            child: Text(AppLocalizations.of(context)!
                                .group_tentative_text_button),
                          ),
                        ));
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 4,
            ),
        itemCount: 20);
  }
}
