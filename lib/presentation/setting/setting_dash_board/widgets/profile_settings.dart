part of setting_dash_board;

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  void _onPickAvatar(BuildContext ctx) async {
    NavigationUtil.pushNamed(routeName: RouteName.updateAvatar);
  }

  void _onTapEditProfile() {
    NavigationUtil.pushNamed(routeName: RouteName.editProfile);
  }

  void _onVerifyEmail(String? email) {
    NavigationUtil.pushNamed(routeName: RouteName.emailVerify, args: email);
  }

  void _onChangePassword() {
    NavigationUtil.pushNamed(routeName: RouteName.changePassword);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        final bool isEmailVerify = state.isEmailVerified ?? false;
        return Card(
          child: Column(
            children: <Widget>[
              InkWellDynamicBorder(
                title: AppLocalizations.of(context)!.change_profile_photo,
                leading: const Icon(Icons.add_a_photo_outlined),
                onTap: () => _onPickAvatar(context),
                hasTopBorderRadius: true,
                hasBottomBorderRadius: false,
              ),
              const DividerSpaceLeft(),
              InkWellDynamicBorder(
                title: AppLocalizations.of(context)!.edit_profile,
                leading: const Icon(Icons.account_circle_outlined),
                trailing: const Icon(Icons.chevron_right),
                onTap: _onTapEditProfile,
                hasTopBorderRadius: false,
                hasBottomBorderRadius: false,
              ),
              const DividerSpaceLeft(),
              InkWellDynamicBorder(
                title: AppLocalizations.of(context)!.change_password,
                leading: const Icon(Icons.password_outlined),
                onTap: _onChangePassword,
                hasTopBorderRadius: false,
                hasBottomBorderRadius: isEmailVerify,
              ),
              if (!isEmailVerify) const DividerSpaceLeft(),
              if (!isEmailVerify)
                InkWellDynamicBorder(
                  title: AppLocalizations.of(context)!.verify_email,
                  leading: const Icon(Icons.email_outlined),
                  onTap: () => _onVerifyEmail(state.email),
                  hasTopBorderRadius: false,
                  hasBottomBorderRadius: true,
                ),
            ],
          ),
        );
      },
    );
  }
}
