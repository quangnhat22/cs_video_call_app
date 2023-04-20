import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@LazySingleton()
class AuthService {
  AuthService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> loginWithFirebase(
    String idToken,
    String deviceName,
  ) async {
    return await _service.dio.post(
      BaseService.authLoginWithFirebasePath,
      data: {
        "id_token": idToken,
        "device": {
          "name": deviceName,
        }
      },
    );
  }
}
