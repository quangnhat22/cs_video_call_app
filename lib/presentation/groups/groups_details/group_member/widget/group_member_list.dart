import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';

import 'group_member_item.dart';

class GroupMemberList extends StatelessWidget {
  const GroupMemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailBloc, GroupDetailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          getDetailSuccess: (groupDetail) {
            final members = groupDetail.members;
            if (members == null || members.isEmpty) {
              return const Center(
                child: Text("No member now!"),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GroupMemberItem(
                    friendId: members[index].id,
                    friendName: members[index].name,
                    avatar: members[index].avatar,
                  );
                },
                itemCount: members.length,
              ),
            );
          },
          getDetailInProgress: () {
            return const Center(
              child: ListSkeleton(),
            );
          },
          orElse: () {
            //TODO: support vi en
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
        );
      },
    );
  }
}
