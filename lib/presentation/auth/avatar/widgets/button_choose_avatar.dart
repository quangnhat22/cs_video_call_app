part of avatar;

class ButtonChooseAvatar extends StatelessWidget {
  const ButtonChooseAvatar({Key? key}) : super(key: key);

  void _handleOnChangePhotoBtn(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          return const DialogPickAvatar();
        }).then((value) async {
      if (value == null) return;
      String? filePath;
      if (value == "camera") {
        filePath = await AppAssetsPicker.getImageFromCamera();
      }
      if (value == "gallery") {
        filePath = await AppAssetsPicker.getImageFromGallery();
      }
      if (filePath == null) return;
      if (ctx.mounted) {
        ctx.read<AvatarCubit>().updateAvatar(filePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context, state) {
        if (state is UpdateAvatarLocalSuccess) {
          return TextButton(
            onPressed: () => _handleOnChangePhotoBtn(context),
            child: Text(
              "Choose a photo",
              style: AppTextStyles.titleAppBarTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16.sp,
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CustomElevatedButton(
                'Choose a photo',
                () => _handleOnChangePhotoBtn(context),
                Theme.of(context).colorScheme.secondary),
          );
        }
      },
    );
  }
}
