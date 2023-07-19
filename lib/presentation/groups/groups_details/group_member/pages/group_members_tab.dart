import 'package:flutter/material.dart';
import 'package:videocall/presentation/groups/groups_details/group_member/widget/group_member_list.dart';

import '../widget/group_member_number.dart';

class GroupMemberPage extends StatefulWidget {
  const GroupMemberPage({super.key});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const GroupMemberView();
  }
}

class GroupMemberView extends StatelessWidget {
  const GroupMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          GroupMemberNumber(),
          GroupMemberList(),
        ],
      ),
    );
  }
}
