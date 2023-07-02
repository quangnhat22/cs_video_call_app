import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/device_entity.dart';
import 'package:videocall/domain/modules/device/device_usecase.dart';

part 'devices_event.dart';
part 'devices_state.dart';
part 'devices_bloc.freezed.dart';

@Injectable()
class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc({required DeviceUseCase deviceUseCase})
      : _deviceUseCase = deviceUseCase,
        super(const _Initial()) {
    on<DevicesEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
      );
    });
  }

  final DeviceUseCase _deviceUseCase;

  Future<void> _started(_Started event, Emitter<DevicesState> emit) async {
    try {
      emit(const DevicesLoading());

      final devices = await _deviceUseCase.getDevices();
      emit(DevicesSuccess(devices: devices));
    } catch (e) {
      emit(DevicesState.failure(message: e.toString()));
    }
  }
}
