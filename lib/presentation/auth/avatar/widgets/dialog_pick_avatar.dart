part of avatar;

class DialogPickAvatar extends StatelessWidget {
  const DialogPickAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AssetDialog(
      handlePhotoFromCamera: () async {
        Navigator.of(context).pop("camera");
      },
      handlePhotoFromGallery: () async {
        Navigator.of(context).pop("gallery");
      },
    );
  }
}
