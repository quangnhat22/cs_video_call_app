import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'network_event.dart';
part 'network_state.dart';
part 'network_bloc.freezed.dart';

@Singleton()
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(const _Initial()) {
    on<NetworkEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          observer: (event) => _observer(event, emit),
          notify: (event) => _notify(event, emit));
    });

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(const NetworkNotify(isConnected: true));
      } else {
        add(const NetworkNotify(isConnected: false));
      }
    });
  }

  _started(_Started event, Emitter<NetworkState> emit) {}

  _observer(NetworkObserver event, Emitter<NetworkState> emit) {}

  _notify(NetworkNotify event, Emitter<NetworkState> emit) {
    event.isConnected
        ? emit(const NetworkSuccess())
        : emit(const NetworkFailure());
  }
}
