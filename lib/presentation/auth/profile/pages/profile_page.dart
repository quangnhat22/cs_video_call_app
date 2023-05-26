part of profile;

class SetUpProfilePage extends StatelessWidget {
  const SetUpProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileFormCubit>()..initValue(),
      child: const SetUpProfileView(),
    );
  }
}

class SetUpProfileView extends StatelessWidget {
  const SetUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileFormCubit, ProfileFormState>(
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AuthHeader(
                'Set up profile',
                'Give more information about you',
                Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                left: 0,
                right: 0,
                // top: 0,
                bottom: 0,
                height: MediaQuery.of(context).size.height *
                    (MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 0.7),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 1
                          : 0.7),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 1),
                    child: const FormSetUpProfile(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
