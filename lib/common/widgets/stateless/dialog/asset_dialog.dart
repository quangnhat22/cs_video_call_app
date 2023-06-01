import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../ink_well/inkwell_dynamic_border.dart';

class AssetDialog extends StatelessWidget {
  const AssetDialog({
    Key? key,
    this.handlePhotoFromCamera,
    this.handlePhotoFromGallery,
  }) : super(key: key);

  final VoidCallback? handlePhotoFromGallery;
  final VoidCallback? handlePhotoFromCamera;

  @override
  Widget build(BuildContext context) {
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
            onTap: handlePhotoFromCamera,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.gallery_source_option,
            leading: const Icon(
              Icons.image,
              color: Colors.black,
            ),
            onTap: handlePhotoFromGallery,
          )
        ],
      ),
    );
  }
}
