part of friends_infor;

class FriendDetailsInfo extends StatelessWidget {
  const FriendDetailsInfo({super.key, required this.friendInfo});

  final UserEntity friendInfo;

  Widget _buildInfoItem(
      {required String title,
      required String subtitle,
      required IconData leading,
      required BuildContext ctx}) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.labelMedium,
      ),
      subtitle: subtitle.isEmpty
          ? Text(AppLocalizations.of(ctx)!.unknown)
          : Text(
              subtitle,
              style: AppTextStyles.bodyLarge,
            ),
      leading: Icon(
        leading,
        color: Theme.of(ctx).colorScheme.onPrimaryContainer,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 90.h),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: <Widget>[
            _buildInfoItem(
                title: AppLocalizations.of(context)!.full_name,
                subtitle: friendInfo.name ?? "",
                leading: Icons.badge,
                ctx: context),
            const Divider(),
            _buildInfoItem(
                title: AppLocalizations.of(context)!.email_text_field_label,
                subtitle: friendInfo.email ?? "",
                leading: Icons.email_outlined,
                ctx: context),
            const Divider(),
            _buildInfoItem(
                title: AppLocalizations.of(context)!.phone_number,
                subtitle: friendInfo.phone ?? "",
                leading: Icons.call_outlined,
                ctx: context),
            const Divider(),
            _buildInfoItem(
                title: AppLocalizations.of(context)!.friend_gender,
                subtitle: friendInfo.gender ?? "",
                leading: Icons.people,
                ctx: context),
            const Divider(),
            _buildInfoItem(
                title: AppLocalizations.of(context)!.friend_birthday,
                subtitle: AppDateTimeFormat.formatDDMMYYYY(friendInfo.birthday),
                leading: Icons.transgender_outlined,
                ctx: context),
          ],
        ),
      ),
    );
  }
}
