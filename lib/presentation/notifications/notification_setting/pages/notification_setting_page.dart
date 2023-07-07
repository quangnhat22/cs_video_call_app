part of notification_setting;

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationSettingCubit>()..pageStarted(),
      child: const NotificationSettingView(),
    );
  }
}

class NotificationSettingView extends StatelessWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
          title: AppLocalizations.of(context)!.turn_on_off_notification),
      body: Column(
        children: const [
          NotificationSwitch(),
        ],
      ),
    );
  }
}
