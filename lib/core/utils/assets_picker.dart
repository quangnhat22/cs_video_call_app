import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AppAssetsPicker {
  static Future<String?> getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 480,
      maxHeight: 640,
      imageQuality: 50,
    );

    return await _cropImage(pickedFile!.path);
  }

  static Future<String?> getImageFromCamera() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      final resPermission = await Permission.camera.request();
      if (resPermission.isDenied || resPermission.isPermanentlyDenied) {
        openAppSettings();
      }

      return null;
    } else {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 480,
        maxHeight: 640,
        imageQuality: 50,
      );

      return await _cropImage(pickedFile!.path);
    }
  }

  static Future<String?> _cropImage(filePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxHeight: 480,
      maxWidth: 680,
      compressQuality: 50,
    );
    return croppedFile?.path;
  }
}
