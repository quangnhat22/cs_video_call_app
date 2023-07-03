import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class MessageService {
  MessageService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> getPinnedMessages(String groupId) async {
    try {
      return await _service.dio.get('${BaseService.messagePath}/$groupId');
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
