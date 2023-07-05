import 'package:injectable/injectable.dart';
import 'package:videocall/data/models/device_model.dart';
import 'package:videocall/domain/entities/device_entity.dart';
import 'package:videocall/domain/modules/device/device_repository.dart';
import 'package:videocall/services/notification_service.dart';

import '../data_sources/remote/service/device_service.dart';

@Injectable(as: DeviceRepository)
class DeviceRepositoryImpl extends DeviceRepository {
  DeviceRepositoryImpl({
    required DeviceService deviceService,
    required NotificationService notificationService,
  })  : _deviceService = deviceService,
        _notificationService = notificationService;

  final DeviceService _deviceService;
  final NotificationService _notificationService;

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

  @override
  Future<bool> deleteDevice(String deviceId, String deviceName) async {
    final fcmToken = await _getFCMToken();

    final res =
        await _deviceService.deleteDevice(deviceId, deviceName, fcmToken ?? '');
    if (res.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<String?> _getFCMToken() async {
    return await _notificationService.getFirebaseMessagingToken();
  }
}
