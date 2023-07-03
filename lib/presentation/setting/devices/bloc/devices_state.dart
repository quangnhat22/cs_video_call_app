part of 'devices_bloc.dart';

@freezed
class DevicesState with _$DevicesState {
  const factory DevicesState.initial() = _Initial;
  const factory DevicesState.loading() = DevicesLoading;
  const factory DevicesState.success({required List<DeviceEntity> devices}) =
      DevicesSuccess;
  const factory DevicesState.failure({
    required String message,
  }) = DevicesFailure;
  const factory DevicesState.deleteSuccess() = DevicesDeleteSuccess;
}
