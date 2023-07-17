import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/search/add_members_search.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart';

import '../../cubit_inivite_new_member/new_member_cubit.dart';

class FabInviteNewFriend extends StatelessWidget {
  const FabInviteNewFriend({super.key, required this.groupId});

  final String groupId;

  bool _isMemberExist(List<UserEntity> members, UserEntity friend) {
    final isExist =
        members.firstWhereOrNull((member) => member.id == friend.id);
    return isExist != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewMemberCubit, NewMemberState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          getListFriendFail: (_) {
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.invite_member_failed,
                TypesSnackBar.error);
          },
          inviteInSuccess: () {
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.invite_member_successfully,
                TypesSnackBar.success);
          },
        );
      },
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () async {
            final currentDetailGroupState =
                context.read<GroupDetailBloc>().state;
            if (currentDetailGroupState is GroupGetDetailSuccess) {
              final List<UserEntity> currentMember =
                  currentDetailGroupState.groupDetail.members ?? [];
              await context.read<NewMemberCubit>().getListFriend();
              if (state is NewMemberGetSuccess && context.mounted) {
                final displayFriend = state.listFriend
                    .where((friend) => !_isMemberExist(currentMember, friend))
                    .toList();
                final newMembers = await showSearch(
                    context: context,
                    delegate: AddMembersSearch(displayFriend));

                if (newMembers != null) {
                  final arrayNewMembers = jsonDecode(newMembers);
                  final memList = (arrayNewMembers as List)
                      .map((mem) => mem as String)
                      .toList();
                  if (memList.isNotEmpty && context.mounted) {
                    context
                        .read<NewMemberCubit>()
                        .inviteNewMember(groupId, memList);
                  }
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
