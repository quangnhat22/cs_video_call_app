import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@Injectable()
class AuthService {
  AuthService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> loginWithFirebase(
    String idToken,
    String deviceName,
    String? fcmToken,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login-with-firebase",
        data: {
          "id_token": idToken,
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          }
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
