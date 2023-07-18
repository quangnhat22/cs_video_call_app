part of group_details;

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
      AppDefaultDialogWidget()
          .setTitle(AppLocalizations.of(ctx)!.confirm)
          .setContent(AppLocalizations.of(ctx)!.do_you_want_leave_group)
          .setAppDialogType(AppDialogType.confirm)
          .setNegativeText(AppLocalizations.of(ctx)!.cancel)
          .setOnPositive(() {
            context
                .read<GroupDetailBloc>()
                .add(GroupDetailLeave(groupId: widget.groupId));
            Navigator.of(context).pop();
          })
          .setPositiveText(AppLocalizations.of(ctx)!.confirm)
          .buildDialog(ctx)
          .show(ctx);
    }

    if (selectedOption == GroupOptions.editGroup) {
      final currentState = context.read<GroupDetailBloc>().state;
      if (currentState is GroupGetDetailSuccess) {
        final groupInfo = currentState.groupDetail;

        NavigationUtil.pushNamed(routeName: RouteName.editGroup, args: {
          "groupId": groupInfo.groupDetails?.id ?? widget.groupId,
          "groupName": groupInfo.groupDetails?.name ?? '',
          "groupImage": groupInfo.groupDetails?.imageUrl,
        }).then((result) {
          if (result == true) {
            context.read<GroupDetailBloc>().add(const GroupDetailRefresh());
          }
        });
      }
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
              title: const GroupName(),
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
