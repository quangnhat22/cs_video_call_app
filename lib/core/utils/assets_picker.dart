import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppAssetsPicker {
  static Future<String?> getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    return await _cropImage(pickedFile!.path);
  }

  static Future<String?> getImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    return await _cropImage(pickedFile!.path);
  }

  static Future<String?> _cropImage(filePath) async {
    CroppedFile? croppedFile = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    return croppedFile?.path;
  }
}
