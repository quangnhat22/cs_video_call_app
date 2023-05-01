import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@LazySingleton()
class UserService {
  UserService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> updateSelf(
    String? name,
    String? avatar,
    String? address,
    String? gender,
    String? phone,
    String? birthday,) async {
    try {
      return await _service.dio.post(
        "${BaseService.authLoginWithFirebasePath}/self",
        data: {
          "name": name,
          "avatar": avatar,
          "address": address,
          "gender": gender,
          "phone": phone,
          "birthday": birthday,
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}