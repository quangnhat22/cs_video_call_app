import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/list_tile/radio_list_title.dart';
import '../../../../core/config/app_config.dart';

class EditThemeView extends StatelessWidget {
  const EditThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EditThemeDialog();
  }
}

class EditThemeDialog extends StatefulWidget {
  const EditThemeDialog({Key? key}) : super(key: key);

  @override
  State<EditThemeDialog> createState() => _EditThemeDialogState();
}

class _EditThemeDialogState extends State<EditThemeDialog> {
  String _selectGender = "";

  @override
  void initState() {
    _selectGender = "Dark";
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
        title: const Text('Select Theme'),
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
