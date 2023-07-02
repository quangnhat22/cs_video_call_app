import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/device_entity.dart';
import 'package:videocall/domain/modules/device/device_repository.dart';

abstract class DeviceUseCase {
  Future<List<DeviceEntity>> getDevices();
}

@Injectable(as: DeviceUseCase)
class DeviceUseCaseImpl extends DeviceUseCase {
  DeviceUseCaseImpl({required DeviceRepository deviceRepository})
      : _deviceRepository = deviceRepository;

  final DeviceRepository _deviceRepository;

  @override
  Future<List<DeviceEntity>> getDevices() async {
    return await _deviceRepository.getDevices();
  }
}
