import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/config/app_assets.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/date_time_format.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/cubit_group_meeting/group_meeting_cubit.dart';

class GroupMeetingListItem extends StatelessWidget {
  const GroupMeetingListItem({
    super.key,
    required this.meetingEntity,
    required this.groupName,
  });

  final GroupMeetingEntity meetingEntity;
  final String groupName;

  void _onTapGroupMeetingItem() {
    NavigationUtil.pushNamed(routeName: RouteName.groupDetailsCall, args: {
      'meetingEntity': meetingEntity,
      'groupName': groupName,
    });
  }

  void _handleOnTapJoin(BuildContext ctx, String meetingId) async {
    await ctx.read<GroupMeetingCubit>().joinMeeting(meetingId: meetingId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: _onTapGroupMeetingItem,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  meetingEntity.title ?? "",
                  style: AppTextStyles.bodyLarge,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.started_at(
                      AppDateTimeFormat.formatDMYHHmm(meetingEntity.timeStart)),
                  style: AppTextStyles.bodyMedium,
                ),
                leading: const CircleAvatar(
                  child: Icon(Icons.videocam_outlined),
                ),
                trailing: (meetingEntity.meetingStatus ==
                        AppMeetingStatus.onGoing)
                    ? TextButton(
                        onPressed: () =>
                            _handleOnTapJoin(context, meetingEntity.id),
                        child: Text(
                          AppLocalizations.of(context)!.join,
                        ),
                      )
                    : (meetingEntity.timeStart != null &&
                            meetingEntity.timeEnd != null)
                        ? Text(AppDateTimeFormat.differentTime(
                            meetingEntity.timeStart!, meetingEntity.timeEnd!))
                        : Container(),
              ),
              if (true)
                Padding(
                  padding:
                      const EdgeInsets.only(right: 12, bottom: 12, left: 12),
                  child: AvatarStack(
                    settings: RestrictedAmountPositions(
                        maxAmountItems: meetingEntity.participants!.length <= 10
                            ? meetingEntity.participants!.length
                            : 10,
                        maxCoverage: 0.3,
                        minCoverage: 0.2,
                        align: StackAlign.left),
                    height: 40,
                    avatars: [
                      for (var n = 0;
                          n < meetingEntity.participants!.length;
                          n++)
                        if (meetingEntity.participants![n]!.avatar!.isNotEmpty)
                          NetworkImage(
                              meetingEntity.participants![n]!.avatar ?? '')
                        else
                          AppAssets.emptyAvatar,
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
