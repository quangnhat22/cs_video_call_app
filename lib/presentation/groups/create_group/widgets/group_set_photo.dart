part of create_group;

class GroupSetPhoto extends StatelessWidget {
  final File? imageFile;
  final Function showImageDialog;

  const GroupSetPhoto(this.imageFile, this.showImageDialog, {super.key});

  @override
  Widget build(BuildContext context) {
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
                            showImageDialog();
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
                      showImageDialog();
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
  }
}
