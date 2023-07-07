part of notification_setting;

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationSettingCubit, NotificationSettingState>(
      builder: (context, state) {
        return state.maybeWhen(
          getSettingInSuccess: (value) {
            return SwitchListTile(
              value: value,
              title:
                  Text(AppLocalizations.of(context)!.turn_on_off_notification),
              secondary: const Icon(Icons.notifications_outlined),
              onChanged: (value) async {
                await context
                    .read<NotificationSettingCubit>()
                    .updateValue(value);
              },
            );
          },
          getSettingInFail: () {
            return RefreshView(
                label: AppLocalizations.of(context)!.something_wrong_try_again,
                onRefresh: () async {
                  await context.read<NotificationSettingCubit>().pageStarted();
                });
          },
          orElse: () {
            return const Center(
              child: Skeleton.rectangular(),
            );
          },
        );
      },
    );
  }
}
