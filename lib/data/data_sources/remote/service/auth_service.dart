import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@Injectable()
class AuthService {
  AuthService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> register(String email, String password, String deviceName,
      String? fcmToken) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/register",
        data: {
          "data": {"email": email, "password": password},
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          },
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> login(
    String email,
    String password,
    String deviceName,
    String? fcmToken,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login",
        data: {
          "data": {"email": email, "password": password},
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          },
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> logOut() async {
    try {
      return await _service.dio.post("${BaseService.authPath}/logout");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> updatePassword(
      String newPassword, String oldPassword) async {
    try {
      return await _service.dio.post("${BaseService.authPath}/update-password",
          data: {"password": newPassword, "oldPassword": oldPassword});
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> sendVerifyEmail() async {
    try {
      return await _service.dio
          .post("${BaseService.authPath}/send-verify-email");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> checkEmailVerified() async {
    try {
      return await _service.dio
          .get("${BaseService.authPath}/is-email-verified");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> sendEmailResetPasswordCode() async {
    try {
      return await _service.dio.post("${BaseService.authPath}/forget-password");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
