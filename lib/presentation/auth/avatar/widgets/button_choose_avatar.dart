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
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: CustomElevatedButton(
          buttonText: 'Choose a photo',
          onPressed: () => _handleOnChangePhotoBtn(context),
          backgroundColor: Theme.of(context).colorScheme.secondary),
    );
  }
}
