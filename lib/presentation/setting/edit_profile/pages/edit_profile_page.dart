part of edit_profile;

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
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: EditProfileForm(),
          ),
        ),
      ),
    );
  }
}
