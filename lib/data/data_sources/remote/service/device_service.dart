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

  Future<Response> deleteDevice(
      String deviceId, String deviceName, String fcmToken) async {
    try {
      return await _service.dio
          .delete('${BaseService.devicePath}/$deviceId', data: {
        "name": deviceName,
        "push_notification_token": fcmToken,
      });
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
