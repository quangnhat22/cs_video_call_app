part of avatar;

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AvatarView();
  }
}

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    (MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 0.7),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: AppAssets.emptyAssetAvatar,
                      ),
                      const ButtonChooseAvatar(),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 14),
                      //   child: CustomOutlinedButton( buttonText: ,'Maybe later', () {},
                      //       const Color.fromRGBO(73, 57, 140, 1)),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
