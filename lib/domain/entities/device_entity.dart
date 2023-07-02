import 'package:videocall/data/models/device_model.dart';

class DeviceEntity {
  String id;
  String? name;
  String? createdAt;
  String? updatedAt;

  DeviceEntity({required this.id, this.name, this.createdAt, this.updatedAt});

  static final deviceEntityEmpty = DeviceEntity(id: "-1");

  static DeviceEntity convertToDeviceEntity({DeviceModel? model}) {
    if (model == null) return deviceEntityEmpty;
    return DeviceEntity(
      id: model.id,
      name: model.name,
      createdAt: model.created_at,
      updatedAt: model.updated_at,
    );
  }
}
