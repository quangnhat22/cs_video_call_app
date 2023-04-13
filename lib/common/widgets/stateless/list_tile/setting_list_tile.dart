import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../divider/divider_space_left.dart';
import '../ink_well/inkwell_dynamic_border.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({Key? key, required this.options}) : super(key: key);

  final List<Map<String, dynamic>> options;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: options
            .mapIndexed(
              (index, item) => Column(
                key: ValueKey(index),
                children: <Widget>[
                  InkWellDynamicBorder(
                    title: item["title"] ?? '',
                    leading: item["leading"],
                    trailing: item["trailing"],
                    onTap: () => item["onTap"],
                    hasTopBorderRadius: index == 0 ? true : false,
                    hasBottomBorderRadius:
                        index == options.length - 1 ? true : false,
                  ),
                  if (index != options.length - 1) const DividerSpaceLeft()
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
