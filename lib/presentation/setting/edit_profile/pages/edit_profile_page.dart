import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/edit_profile_form.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MPageAppBar(
        title: "Edit Profile",
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: EditProfileForm(),
        ),
      ),
    );
  }
}
