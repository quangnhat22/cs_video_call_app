part of setting_dash_board;

class DeviceSettings extends StatelessWidget {
  const DeviceSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> deviceOptions = [
      {
        "title": AppLocalizations.of(context)!.language,
        "leading": const Icon(Icons.public),
        // TODO: "fix hardcode theme"
        "trailing": const Text("en"),
        "onTap": () {}
      },
      {
        "title": AppLocalizations.of(context)!.theme,
        "leading": const Icon(Icons.brightness_medium_outlined),
        // TODO: "fix hardcode theme"
        "trailing": const Text("light"),
        "onTap": () {}
      },
      {
        "title": AppLocalizations.of(context)!.notifications,
        "leading": const Icon(Icons.notifications_outlined),
        "trailing": const Icon(Icons.chevron_right),
        "onTap": () {}
      },
      {
        "title": AppLocalizations.of(context)!.devices,
        "leading": const Icon(Icons.devices_outlined),
        "trailing": const Icon(Icons.chevron_right),
        "onTap": () {}
      },
    ];

    return SettingListTile(options: deviceOptions);
  }
}
