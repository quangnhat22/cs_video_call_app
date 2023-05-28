part of create_group;

class GroupSetPhoto extends StatefulWidget {
  const GroupSetPhoto({super.key});

  @override
  State<GroupSetPhoto> createState() => _GroupSetPhotoState();
}

class _GroupSetPhotoState extends State<GroupSetPhoto> {
  File? imageFile;

  void _getFromGallery(BuildContext ctx) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (ctx.mounted) {
      _cropImage(pickedFile!.path, ctx);
    }
  }

  void _getFromCamera(BuildContext ctx) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (ctx.mounted) {
      _cropImage(pickedFile!.path, ctx);
    }
  }

  void _cropImage(filePath, BuildContext ctx) async {
    CroppedFile? croppedFile = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    if (croppedFile != null) {
      setState(() {
        imageFile = File(croppedFile.path);
        debugPrint(imageFile.toString());
      });

      if (ctx.mounted) {
        ctx.read<CreateGroupCubit>().groupImageChanged(croppedFile.path);
      }
    }
  }

  void _showImageDialog(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.choose_image_source_dialog_title,
              style: const TextStyle(fontSize: 20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWellDynamicBorder(
                  title: AppLocalizations.of(context)!.camera_source_option,
                  leading: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getFromCamera(ctx);
                  },
                ),
                InkWellDynamicBorder(
                  title: AppLocalizations.of(context)!.gallery_source_option,
                  leading: const Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getFromGallery(ctx);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          imageFile != null ? FileImage(imageFile!) : null,
                      child: imageFile != null
                          ? null
                          : IconButton(
                              onPressed: () {
                                _showImageDialog(context);
                              },
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 35,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          _showImageDialog(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.set_new_photo,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
