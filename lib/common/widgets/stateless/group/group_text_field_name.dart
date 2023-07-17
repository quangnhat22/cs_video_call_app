import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupInputName extends StatelessWidget {
  const GroupInputName(
      {required this.handleGroupNameChange, this.initialValue, super.key});

  final Function handleGroupNameChange;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        initialValue: initialValue ?? '',
        onChanged: (groupName) {
          handleGroupNameChange(groupName);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          label: Text('${AppLocalizations.of(context)!.group_name} (*)'),
        ),
      ),
    );
  }
}
