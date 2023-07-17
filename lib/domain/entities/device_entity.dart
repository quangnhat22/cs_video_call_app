import 'package:videocall/data/models/device_model.dart';

class DeviceEntity {
  final String id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isCurrentDevice;

  DeviceEntity({
    required this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.isCurrentDevice = false,
  });

  static final deviceEntityEmpty = DeviceEntity(id: "-1");

  static DeviceEntity convertToDeviceEntity({DeviceModel? model}) {
    if (model == null) return deviceEntityEmpty;
    return DeviceEntity(
      id: model.id,
      name: model.name,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      isCurrentDevice: model.isCurrentDevice ?? false,
    );
  }
}
