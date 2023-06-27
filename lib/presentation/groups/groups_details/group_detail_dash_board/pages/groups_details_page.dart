import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/call/group_call/pages/group_call_main_page.dart';
import 'package:videocall/presentation/groups/groups_details/group_discuss/group_discuss_tab.dart';
import 'package:videocall/presentation/groups/groups_details/group_member/pages/group_members_tab.dart';

import '../../bloc/group_detail_bloc.dart';
import '../../cubit_group_meeting/group_meeting_cubit.dart';
import '../../cubit_inivite_new_member/new_member_cubit.dart';
import '../../widgets/meeting/fab_create_new_meeting.dart';
import '../../widgets/member/fab_invite_new_member.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GroupDetailBloc>()
            ..add(GroupDetailEvent.started(groupId: groupId)),
        ),
        BlocProvider(
          create: (_) => getIt<NewMemberCubit>()..getListFriend(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<GroupMeetingCubit>()..getListGroupMeeting(groupId: groupId),
        ),
      ],
      child: const GroupDetailView(),
    );
  }
}

class GroupDetailView extends StatefulWidget {
  const GroupDetailView({super.key});

  @override
  State<GroupDetailView> createState() => _GroupDetailViewState();
}

class _GroupDetailViewState extends State<GroupDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> allMembers = ['Nguyễn Văn Quý', 'Lý Nhân Danh'];
  final List<String> membersSuggestions = ['Trần Đức Nghĩa', 'Lê Hậu Nhân'];

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
      return const FabInviteNewFriend();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Team Anh Em Siêu Nhơn'),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottom: TabBar(controller: _tabController, tabs: <Widget>[
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_calls_title),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_discuss_title),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_members_title),
              )
            ]),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              GroupCallPage(),
              GroupDiscussTab(),
              GroupMemberPage()
            ],
          ),
          floatingActionButton: _bottomButtons(),
        ));
  }
}