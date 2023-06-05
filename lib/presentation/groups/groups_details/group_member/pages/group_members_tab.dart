import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/config/app_text_styles.dart';

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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              '4 ${AppLocalizations.of(context)!.members_text_title}',
              style: AppTextStyles.mediumTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text(
                    'Nguyễn Văn An',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: const CircleAvatar(child: Text('A')),
                  trailing: index == 0
                      ? Text(AppLocalizations.of(context)!.owner_text)
                      : null,
                );
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
