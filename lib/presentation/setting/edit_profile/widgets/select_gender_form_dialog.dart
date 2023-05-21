import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/list_tile/radio_list_title.dart';
import '../../../../core/config/app_enum.dart';

class GenderFormDialog extends StatefulWidget {
  const GenderFormDialog({
    Key? key,
    required this.initGender,
  }) : super(key: key);

  final String initGender;

  @override
  State<GenderFormDialog> createState() => _GenderFormDialogState();
}

class _GenderFormDialogState extends State<GenderFormDialog> {
  String _selectGender = "";

  @override
  void initState() {
    _selectGender = widget.initGender;
    super.initState();
  }

  void _handleChangeRadioValue(String value) {
    setState(() {
      _selectGender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_selectGender);
        return Future.value(true);
      },
      child: AlertDialog(
        title: const Text('Select Gender'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CRadioListTitle(
              value: AppGender.male.value,
              groupValue: _selectGender,
              onChanged: _handleChangeRadioValue,
            ),
            CRadioListTitle(
              value: AppGender.female.value,
              groupValue: _selectGender,
              onChanged: _handleChangeRadioValue,
            ),
            CRadioListTitle(
              value: AppGender.others.value,
              groupValue: _selectGender,
              onChanged: _handleChangeRadioValue,
            ),
          ],
        ),
      ),
    );
  }
}
