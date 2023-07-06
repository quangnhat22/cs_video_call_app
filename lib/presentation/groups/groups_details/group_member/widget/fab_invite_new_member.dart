import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/search/add_members_search.dart';
import 'package:videocall/core/utils/snack_bar.dart';

import '../../cubit_inivite_new_member/new_member_cubit.dart';

class FabInviteNewFriend extends StatelessWidget {
  const FabInviteNewFriend({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewMemberCubit, NewMemberState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          getListFriendFail: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
          inviteInSuccess: () {
            SnackBarApp.showSnackBar(
                context, 'Invite successfully', TypesSnackBar.success);
          },
        );
      },
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () async {
            await context.read<NewMemberCubit>().getListFriend();
            if (state is NewMemberGetSuccess && context.mounted) {
              final newMembers = await showSearch(
                  context: context,
                  delegate: AddMembersSearch(state.listFriend));

              if (newMembers != null) {
                final arrayNewMembers = jsonDecode(newMembers);
                final memList = (arrayNewMembers as List)
                    .map((mem) => mem as String)
                    .toList();
                if (memList.isNotEmpty) {
                  context
                      .read<NewMemberCubit>()
                      .inviteNewMember(groupId, memList);
                }
              }
            }
          },
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const StadiumBorder(),
          child: (state is NewMemberGetListProgress)
              ? const CircularProgressIndicator()
              : Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
        );
      },
    );
  }
}
