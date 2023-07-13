part of setting_dash_board;

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      buildWhen: (previous, current) =>
          previous.avatar != current.avatar ||
          previous.name != current.name ||
          previous.email != current.email,
      builder: (context, state) {
        return state.when(initial: ((avatar, name, email, _, __, ___) {
          return Column(
            children: <Widget>[
              CustomAvatarImage(
                maxRadiusEmptyImg: 64,
                size: CustomAvatarSize.large,
                urlImage: avatar,
              ),
              const SizedBox(
                height: 12,
              ),
              name != null
                  ? Text(
                      name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      AppLocalizations.of(context)!.unknown_name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(
                height: 12,
              ),
              email != null
                  ? Text(
                      email,
                      style: AppTextStyles.titleMedium,
                    )
                  : Container(),
            ],
          );
        }));
      },
    );
  }
}
