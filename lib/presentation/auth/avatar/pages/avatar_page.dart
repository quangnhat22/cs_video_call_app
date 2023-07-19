part of avatar;

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AvatarCubit>()..initValue(),
      child: const AvatarView(),
    );
  }
}

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AvatarCubit, AvatarState>(
      listener: (context, state) {
        if (state.statusUpload == StatusUploadAvatar.success) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_avatar_success,
              TypesSnackBar.success);
        }
        if (state.statusUpload == StatusUploadAvatar.fail) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_avatar_success,
              TypesSnackBar.error);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AuthHeader(
                AppLocalizations.of(context)!.add_photo,
                AppLocalizations.of(context)!.add_photo_so_your_friend_know,
                AppColors.lightColorScheme.secondary,
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
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Container(
                    margin: const EdgeInsets.only(top: 1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 32.h,
                          ),
                          const AvatarUser(),
                          SizedBox(
                            height: 32.h,
                          ),
                          const ButtonChooseAvatar(),
                          //const ActionsAvatar(),
                        ],
                      ),
                    ),
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
