import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart';

import 'group_meeting_list_item.dart';

class GroupMeetingList extends StatelessWidget {
  const GroupMeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupMeetingCubit, GroupMeetingState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const ListSkeleton();
          },
          getListFail: (message) {
            return Center(
              //TODO: support language
              child: Text(message ?? "Something wrong! Try again!"),
            );
          },
          getListSuccess: (listMeeting) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GroupMeetingListItem(
                        meetingEntity: listMeeting[index],
                      );
                    },
                    childCount: listMeeting.length,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
