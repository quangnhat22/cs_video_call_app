import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/groups/group_list/group_list.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/pages/group_meeting_page.dart';
import 'package:videocall/presentation/groups/groups_details/group_member/pages/group_members_tab.dart';
import 'package:videocall/presentation/groups/groups_details/group_messages/group_messages.dart';

import '../../bloc/group_detail_bloc.dart';
import '../../cubit_inivite_new_member/new_member_cubit.dart';
import '../../group_member/widget/fab_invite_new_member.dart';
import '../widgets/fab_create_new_meeting.dart';

enum GroupOptions { leaveGroup, editGroup }

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({
    super.key,
    required this.groupArgs,
  });

  final GroupArguments groupArgs;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GroupDetailBloc>()
            ..add(GroupDetailEvent.started(groupId: groupArgs.groupId)),
        ),
        BlocProvider(
          create: (_) => getIt<NewMemberCubit>()..getListFriend(),
        ),
      ],
      child: GroupDetailView(
        groupId: groupArgs.groupId,
        groupName: groupArgs.groupName,
        groupAvatar: groupArgs.groupAvatar ?? '',
      ),
    );
  }
}

class GroupDetailView extends StatefulWidget {
  const GroupDetailView(
      {super.key,
      required this.groupId,
      required this.groupName,
      this.groupAvatar});

  final String groupId;
  final String groupName;
  final String? groupAvatar;

  @override
  State<GroupDetailView> createState() => _GroupDetailViewState();
}

class _GroupDetailViewState extends State<GroupDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  Widget? _bottomButtons() {
    if (_tabController.index == 0) {
      return const FabCreateNewMeeting();
    }
    if (_tabController.index == 2) {
      return FabInviteNewFriend(
        groupId: widget.groupId,
      );
    }
    return null;
  }

  void handleGroupOptionsSelected(
      BuildContext ctx, GroupOptions selectedOption) {
    if (selectedOption == GroupOptions.leaveGroup) {
      context
          .read<GroupDetailBloc>()
          .add(GroupDetailLeave(groupId: widget.groupId));
    }

    if (selectedOption == GroupOptions.editGroup) {
      NavigationUtil.pushNamed(routeName: RouteName.editGroup, args: {
        "groupId": widget.groupId,
        "groupName": widget.groupName,
        "groupImage": widget.groupAvatar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: BlocListener<GroupDetailBloc, GroupDetailState>(
          listener: (context, state) {
            if (state is GroupDetailLeaveSuccess) {
              Navigator.of(context).pop(true);
              SnackBarApp.showSnackBar(
                  null,
                  AppLocalizations.of(context)!.leave_group_success,
                  TypesSnackBar.success);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.groupName),
              backgroundColor: Theme.of(context).colorScheme.background,
              bottom: TabBar(controller: _tabController, tabs: <Widget>[
                Tab(
                  child: Text(AppLocalizations.of(context)!
                      .group_details_tab_calls_title),
                ),
                Tab(
                  child: Text(AppLocalizations.of(context)!
                      .group_details_tab_messages_title),
                ),
                Tab(
                  child: Text(AppLocalizations.of(context)!
                      .group_details_tab_members_title),
                )
              ]),
              actions: <Widget>[
                PopupMenuButton<GroupOptions>(
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                  onSelected: (GroupOptions item) {
                    handleGroupOptionsSelected(context, item);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<GroupOptions>>[
                    PopupMenuItem<GroupOptions>(
                      value: GroupOptions.leaveGroup,
                      child: Text(AppLocalizations.of(context)!.leave_group),
                    ),
                    PopupMenuItem<GroupOptions>(
                      value: GroupOptions.editGroup,
                      child: Text(AppLocalizations.of(context)!.edit_group),
                    ),
                  ],
                )
              ],
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                GroupMeetingPage(
                  groupId: widget.groupId,
                ),
                GroupMessagesPage(groupId: widget.groupId),
                const GroupMemberPage()
              ],
            ),
            floatingActionButton: _bottomButtons(),
          ),
        ));
  }
}
