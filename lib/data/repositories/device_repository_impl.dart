import 'package:injectable/injectable.dart';
import 'package:videocall/data/models/device_model.dart';
import 'package:videocall/domain/entities/device_entity.dart';
import 'package:videocall/domain/modules/device/device_repository.dart';

import '../data_sources/remote/service/device_service.dart';

@Injectable(as: DeviceRepository)
class DeviceRepositoryImpl extends DeviceRepository {
  DeviceRepositoryImpl({required DeviceService deviceService})
      : _deviceService = deviceService;

  final DeviceService _deviceService;

  @override
  Future<List<DeviceEntity>> getDevices() async {
    try {
      final res = await _deviceService.getDevices();
      if (res.statusCode == 200) {
        final listDeviceJson = res.data["data"] as List<dynamic>?;
        if (listDeviceJson != null) {
          final deviceModels = listDeviceJson.map((deviceJson) {
            return DeviceModel.fromJson(deviceJson);
          }).toList();

          final deviceEntities = deviceModels
              .map((deviceModel) =>
                  DeviceEntity.convertToDeviceEntity(model: deviceModel))
              .toList();

          return deviceEntities;
        }
      }
      return List<DeviceEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
