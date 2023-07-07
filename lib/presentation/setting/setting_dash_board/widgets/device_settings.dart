part of setting_dash_board;

class DeviceSettings extends StatelessWidget {
  const DeviceSettings({Key? key}) : super(key: key);

  Future<void> _onTapLanguageBtn(BuildContext ctx, String currentLang) {
    return _showEditDialog(ctx, const EditLanguageView());
  }

  Future<void> _onTapThemeBtn(BuildContext ctx, String currentTheme) {
    return _showEditDialog(ctx, const EditThemeView());
  }

  Future<void> _showEditDialog(BuildContext ctx, Widget form) {
    return showDialog(
      context: ctx,
      builder: (context) => form,
    ).then((_) {
      ctx.read<SettingCubit>().getValueThemeAndLang();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: (_, __, ___, ____, theme, lang) {
            return Card(
              child: Column(
                children: <Widget>[
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.language,
                    leading: const Icon(Icons.public),
                    trailing: Text(lang),
                    onTap: () => _onTapLanguageBtn(context, lang),
                    hasTopBorderRadius: true,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.theme,
                    leading: const Icon(Icons.brightness_medium_outlined),
                    trailing: Text(theme),
                    onTap: () => _onTapThemeBtn(context, theme),
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.notifications,
                    leading: const Icon(Icons.notifications_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      NavigationUtil.pushNamed(
                          routeName: RouteName.notificationSetting);
                    },
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.devices,
                    leading: const Icon(Icons.devices_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      NavigationUtil.pushNamed(routeName: RouteName.devices);
                    },
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: true,
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
