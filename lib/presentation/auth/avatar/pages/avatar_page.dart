part of avatar;

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AvatarCubit>(),
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
        state.whenOrNull(
          updateAvatarSuccess: () {
            //TODO: local
            SnackBarApp.showSnackBar(
                context, "Update success", TypesSnackBar.success);
          },
          updateAvatarFailure: (message) {
            //TODO: local
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.success);
          },
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AuthHeader(
                'Add a photo',
                'Add a profile photo so your friends know it’s you!',
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
                            height: 16.h,
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
