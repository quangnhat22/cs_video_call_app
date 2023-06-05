import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:videocall/core/utils/date_time_format.dart';

import '../../../../../core/routes/app_navigation.dart';
import '../../../../../core/routes/route_name.dart';

class ListGroupMeeting extends StatelessWidget {
  const ListGroupMeeting({
    super.key,
    required this.groupId,
    this.meetingName,
    this.startedTime,
    this.meetingStatus,
  });

  final String groupId;
  final String? meetingName;
  final DateTime? startedTime;
  final String? meetingStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          NavigationUtil.pushNamed(routeName: RouteName.teamDetails);
        },
        child: Column(
          children: [
            ListTile(
              title: Text(meetingName ?? ""),
              subtitle: Text(
                AppDateTimeFormat.convertToHourMinuteFollowDay(
                    startedTime ?? DateTime.now()),
              ),
              leading: const CircleAvatar(
                child: Icon(Icons.videocam_outlined),
              ),
              // trailing: groupCalls[index]['isCalling']
              //     ? TextButton(
              //         onPressed: () {},
              //         child: const Text('Join'),
              //       )
              //     : Text(groupCalls[index]['duration']),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Join'),
              ),
            ),
            if (true)
              Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 12, left: 12),
                child: AvatarStack(
                  settings: RestrictedAmountPositions(
                    maxAmountItems: 10,
                    maxCoverage: 0.3,
                    minCoverage: 0.2,
                    align: StackAlign.left,
                  ),
                  height: 40,
                  avatars: [
                    for (var n = 0; n < 50; n++)
                      NetworkImage('https://i.pravatar.cc/150?img=$n'),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
