import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class CallService {
  CallService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createNewCall(String friendId, String roomId) async {
    try {
      return await _service.dio.post(
        "${BaseService.callPath}/$friendId/$roomId",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
