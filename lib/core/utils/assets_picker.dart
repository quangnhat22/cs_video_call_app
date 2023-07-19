import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AppAssetsPicker {
  static Future<String?> getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 50,
    );

    return await _cropImage(pickedFile!.path);
  }

  static Future<String?> getImageFromCamera() async {
    try {
      final status = await Permission.camera.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        final resPermission = await Permission.camera.request();
        if (resPermission.isDenied || resPermission.isPermanentlyDenied) {
          openAppSettings();
        }
      } else if (status.isGranted) {
        XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxWidth: 1080,
          maxHeight: 1080,
          imageQuality: 50,
        );
        return await _cropImage(pickedFile!.path);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
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
