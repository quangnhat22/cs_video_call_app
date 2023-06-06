import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/domain/entities/user_entity.dart';

class AddMembersSearch extends SearchDelegate<String> {
  final List<UserEntity> allMembers;
  List<UserEntity> selectedMembers = [];

  AddMembersSearch(this.allMembers);

  void handleSelectMembers(UserEntity member, Function setState) {
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
    try {
      final List<String> selectMemberId =
          selectedMembers.map((member) => member.id).toList();
      query = jsonEncode(selectMemberId);
      close(context, query);
    } catch (e) {
      throw Exception(e.toString());
    }
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
    final List<UserEntity> memberResults = allMembers
        .where(
          (member) => member.name == null
              ? false
              : member.name!.toLowerCase().contains(
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
                  title: Text(memberResults[index].name ?? ""),
                  secondary: CustomAvatarImage(
                    urlImage: memberResults[index].avatar,
                    widthImage: 50,
                    heightImage: 50,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: selectedMembers.contains(memberResults[index]),
                  onChanged: (bool? value) {
                    handleSelectMembers(memberResults[index], setState);
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
