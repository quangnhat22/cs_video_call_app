part of avatar;

class AvatarUser extends StatelessWidget {
  const AvatarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      buildWhen: (previous, current) =>
          previous != current && current is UpdateAvatarLocalSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          updateAvatarInProgress: () {
            return Skeleton.circle(
              width: 240.w,
              height: 240.w,
            );
          },
          orElse: () {
            return CustomAvatarImage(
              urlImage:
                  (state is UpdateAvatarLocalSuccess) ? state.urlImage : null,
              maxRadiusEmptyImg: 120,
              widthImage: 240.w,
              heightImage: 240.h,
            );
          },
        );
      },
    );
  }
}
