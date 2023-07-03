import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/empty_message/empty_message.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart';

import 'group_meeting_list_item.dart';

class GroupMeetingList extends StatelessWidget {
  const GroupMeetingList({super.key, required this.handleRefresh});

  final Function handleRefresh;

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
              child:
                  Text(message ?? AppLocalizations.of(context)!.error_message),
            );
          },
          getListSuccess: (listMeeting) {
            return listMeeting.isEmpty
                ? EmptyMessage(
                    title:
                        AppLocalizations.of(context)!.empty_call_list_message,
                    handleRefresh: () {
                      handleRefresh(context);
                    },
                  )
                : CustomScrollView(
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
