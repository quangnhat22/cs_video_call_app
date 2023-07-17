import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videocall/common/widgets/stateless/ink_well/inkwell_dynamic_border.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart';
import 'package:videocall/presentation/groups/groups_details/group_edit/cubit/edit_group_cubit.dart';

class GroupChangePhoto extends StatefulWidget {
  const GroupChangePhoto(
      {this.mode = AppGroupFormMode.create, this.groupImage, super.key});

  final AppGroupFormMode mode;
  final String? groupImage;

  @override
  State<GroupChangePhoto> createState() => _GroupChangePhotoState();
}

class _GroupChangePhotoState extends State<GroupChangePhoto> {
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
        if (widget.mode == AppGroupFormMode.create) {
          ctx.read<CreateGroupCubit>().groupImageChanged(croppedFile.path);
        } else {
          ctx.read<EditGroupCubit>().groupImageChanged(croppedFile.path);
        }
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
                if (widget.groupImage != null && imageFile == null)
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(widget.groupImage!),
                  ),
                if (widget.groupImage == null && imageFile == null)
                  CircleAvatar(
                    radius: 55,
                    child: IconButton(
                      onPressed: () {
                        _showImageDialog(context);
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        size: 35,
                      ),
                    ),
                  ),
                if (imageFile != null)
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: FileImage(imageFile!),
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
  }
}
