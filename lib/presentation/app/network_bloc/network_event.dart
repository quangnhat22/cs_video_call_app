part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
  const factory NetworkEvent.started() = _Started;
  const factory NetworkEvent.observer() = NetworkObserver;
  const factory NetworkEvent.notify({@Default(true) bool isConnected}) =
      NetworkNotify;
}
