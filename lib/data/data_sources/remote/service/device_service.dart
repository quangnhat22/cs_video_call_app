import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class DeviceService {
  DeviceService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> getDevices() async {
    try {
      return await _service.dio.get(BaseService.devicePath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
