part of setting_dash_board;

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileOptions = [
      {
        "title": AppLocalizations.of(context)!.change_profile_photo,
        "leading": const Icon(Icons.add_a_photo_outlined),
        "onTap": () {}
      },
      {
        "title": AppLocalizations.of(context)!.edit_profile,
        "leading": const Icon(Icons.account_circle_outlined),
        "trailing": const Icon(Icons.chevron_right),
        "onTap": () {
          NavigationUtil.pushNamed(routeName: RouteName.editProfile);
        }
      },
      {
        "title": AppLocalizations.of(context)!.change_password,
        "leading": const Icon(Icons.password_outlined),
        "trailing": const Icon(Icons.chevron_right),
        "onTap": () {}
      }
    ];

    return SettingListTile(options: profileOptions);
  }
}
