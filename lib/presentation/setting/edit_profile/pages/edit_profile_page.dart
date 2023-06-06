import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/core/utils/screen_utils.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/presentation/setting/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/edit_profile_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileCubit>()..initValue(),
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.submitStatus != current.submitStatus,
      listener: (context, state) {
        if (state.submitStatus == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.cant_update_profile,
              TypesSnackBar.error);
        }
        if (state.submitStatus == FormzSubmissionStatus.success) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_profile_success,
              TypesSnackBar.success);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
