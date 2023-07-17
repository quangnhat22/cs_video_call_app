import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/cubit_group_meeting/group_meeting_cubit.dart';
import 'package:videocall/presentation/others/refresh_view.dart';

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
            return RefreshView(
                label: AppLocalizations.of(context)!.something_wrong_try_again,
                onRefresh: () {
                  context.read<GroupMeetingCubit>().refreshGroupMeeting();
                });
          },
          getListSuccess: (listMeeting) {
            return listMeeting.isEmpty
                ? RefreshView(
                    label:
                        AppLocalizations.of(context)!.empty_call_list_message,
                    onRefresh: () {
                      context.read<GroupMeetingCubit>().refreshGroupMeeting();
                    })
                : RefreshIndicator(
                    onRefresh: () async {
                      context.read<GroupMeetingCubit>().refreshGroupMeeting();
                    },
                    child: CustomScrollView(
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
                    ),
                  );
          },
        );
      },
    );
  }
}
