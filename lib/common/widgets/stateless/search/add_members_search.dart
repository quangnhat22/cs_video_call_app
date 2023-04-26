import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddMembersSearch extends SearchDelegate<String> {
  final List<String> allMembers;
  List<String> selectedMembers = [];

  AddMembersSearch(this.allMembers);

  void handleAddMembers(String member, Function setState) {
    if (!selectedMembers.contains(member)) {
      setState(() {
        selectedMembers.add(member);
      });
    } else {
      setState(() {
        selectedMembers.remove(member);
      });
    }
  }

  void handleCloseDelegate(BuildContext context) {
    query = jsonEncode(selectedMembers);
    close(context, query);
  }

  Widget buildAmountSelectedTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        '${selectedMembers.length.toString()} ${AppLocalizations.of(context)!.selected_text}',
        style: AppTextStyles.mediumTitleTextStyle,
      ),
    );
  }

  Widget buildSearchedResults(BuildContext context) {
    final List<String> memberResults = allMembers
        .where(
          (member) => member.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAmountSelectedTitle(context),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(memberResults[index]),
                  secondary: const CircleAvatar(child: Text('A')),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: selectedMembers.contains(memberResults[index]),
                  onChanged: (bool? value) {
                    handleAddMembers(memberResults[index], setState);
                  },
                );
              },
              itemCount: memberResults.length,
            ),
          ],
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {
          handleCloseDelegate(context);
        },
        icon: const Icon(Icons.done),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          handleCloseDelegate(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchedResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchedResults(context);
  }
}
