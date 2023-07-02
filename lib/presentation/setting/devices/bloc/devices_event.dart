part of 'devices_bloc.dart';

@freezed
class DevicesEvent with _$DevicesEvent {
  const factory DevicesEvent.started() = _Started;
}