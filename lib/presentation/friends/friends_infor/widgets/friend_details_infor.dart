part of friends_infor;

class FriendDetailsInfo extends StatelessWidget {
  const FriendDetailsInfo({super.key});

  Widget _buildInfoItem(
      {required String title,
      required String subtitle,
      required IconData leading,
      required BuildContext ctx}) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle.isEmpty
          ? Text(AppLocalizations.of(ctx)!.unknown)
          : Text(subtitle),
      leading: Icon(
        leading,
        color: Theme.of(ctx).colorScheme.onPrimaryContainer,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendInfoCubit, FriendInfoState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 90.h),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: <Widget>[
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.full_name,
                    subtitle: state.user.name ?? "",
                    leading: Icons.badge,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.email_text_field_label,
                    subtitle: state.user.email ?? "",
                    leading: Icons.email_outlined,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.phone_number,
                    subtitle: state.user.phone ?? "",
                    leading: Icons.call_outlined,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.friend_gender,
                    subtitle: state.user.gender ?? "",
                    leading: Icons.people,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.friend_birthday,
                    subtitle:
                        AppDateTimeFormat.formatDDMMYYYY(state.user.birthday),
                    leading: Icons.transgender_outlined,
                    ctx: context),
              ],
            ),
          ),
        );
      },
    );
  }
}
