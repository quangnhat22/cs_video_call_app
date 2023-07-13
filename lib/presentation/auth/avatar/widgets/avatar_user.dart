part of avatar;

class AvatarUser extends StatelessWidget {
  const AvatarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return CustomAvatarImage(
          urlImage: state.urlImage,
          maxRadiusEmptyImg: 120,
          size: CustomAvatarSize.extraLarge,
        );
      },
    );
  }
}
