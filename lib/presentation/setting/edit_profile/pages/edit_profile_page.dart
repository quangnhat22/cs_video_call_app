import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/core/utils/screen_utils.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/edit_profile_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.edit_profile,
      ),
      body: GestureDetector(
        onTap: () {
          AppScreenUtils.hideInputKeyboard();
        },
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: EditProfileForm(),
          ),
        ),
      ),
    );
  }
}
