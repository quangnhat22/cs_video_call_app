import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class GroupService {
  GroupService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createGroup(String? groupName, String? imageUrl) async {
    try {
      return await _service.dio.post(BaseService.groupPath,
          data: {"name": groupName, "image_url": imageUrl});
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
