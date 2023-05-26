part of setting_dash_board;

class SettingDashBoardPage extends StatelessWidget {
  const SettingDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingCubit>()
        ..getValueThemeAndLang()
        ..getSelf(),
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
    return BlocListener<SettingCubit, SettingState>(
      listenWhen: (previous, current) => previous.email != current.email,
      listener: (context, state) {
        if (state.isEmailVerified != null && !state.isEmailVerified!) {
          NavigationUtil.pushNamed(
                  routeName: RouteName.emailVerify, args: state.email)
              .then((value) {
            if (value) {
              context.read<SettingCubit>().emailVerified();
            }
          });
        }
      },
      child: Scaffold(
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
                  const ProfileInfo(),
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
      ),
    );
  }
}
