import 'package:videocall/domain/entities/device_entity.dart';

abstract class DeviceRepository {
  Future<List<DeviceEntity>> getDevices();

  Future<bool> deleteDevice(String deviceId, String deviceName);
}
