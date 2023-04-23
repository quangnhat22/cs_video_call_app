part of setting_dash_board;

class SettingDashBoardPage extends StatelessWidget {
  const SettingDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingCubit>(),
      child: const SettingDashBoardView(),
    );
  }
}

class SettingDashBoardView extends StatelessWidget {
  const SettingDashBoardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(title: AppLocalizations.of(context)!.setting),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 32.h,
                ),
                const CustomAvatarImage(
                  maxRadiusEmptyImg: 64,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const ProfileSettings(),
                SizedBox(
                  height: 4.h,
                ),
                const DeviceSettings(),
                SizedBox(
                  height: 8.h,
                ),
                const AboutUsButton(),
                SizedBox(
                  height: 8.h,
                ),
                const LogOutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
