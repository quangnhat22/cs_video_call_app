part of avatar;

class DialogPickAvatar extends StatelessWidget {
  const DialogPickAvatar({Key? key}) : super(key: key);

  void _handleUpdateImage(String? filePath, BuildContext ctx) {
    if (filePath == null) return;
    ctx.read<AvatarCubit>().updateAvatar(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AvatarCubit>(),
      child: BlocConsumer<AvatarCubit, AvatarState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            state.whenOrNull(updateAvatarSuccess: () {
              SnackBarApp.showSnackBar(
                  context, "Update avatar success", TypesSnackBar.success);
            }, updateAvatarFailure: (message) {
              SnackBarApp.showSnackBar(
                  context, "Update avatar failure", TypesSnackBar.error);
            });
          },
          builder: (context, state) {
            return AssetDialog(
              handlePhotoFromCamera: () async {
                final filePath = await AppAssetsPicker.getImageFromCamera();
                if (context.mounted) {
                  _handleUpdateImage(filePath, context);
                }
              },
              handlePhotoFromGallery: () async {
                final filePath = await AppAssetsPicker.getImageFromGallery();
                if (context.mounted) {
                  _handleUpdateImage(filePath, context);
                }
              },
            );
          }),
    );
  }
}
