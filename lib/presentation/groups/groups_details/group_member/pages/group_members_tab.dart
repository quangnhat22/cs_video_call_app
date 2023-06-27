import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../groups_details.dart';

class GroupMemberPage extends StatelessWidget {
  const GroupMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
