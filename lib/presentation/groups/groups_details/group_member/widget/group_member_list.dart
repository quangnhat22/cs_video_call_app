import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              return Center(
                child: Text(AppLocalizations.of(context)!.no_members_found),
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
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
        );
      },
    );
  }
}
