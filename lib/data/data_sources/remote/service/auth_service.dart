import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@LazySingleton()
class AuthService {
  AuthService({required BaseService service}) : _service = service;

  final BaseService _service;
}
