import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

import '../../../core/services/notification_controller.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthUseCase _useCase;
  late final StreamSubscription<String?> _accessTokenSubscription;
  late final StreamSubscription<String?> _refreshTokenSubscription;

  AppBloc({required AuthUseCase authUC})
      : _useCase = authUC,
        super(AppLoading()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserChanged>(_onAppUserChanged);

    // listen [accessToken] and [refreshToken] in local change
    _accessTokenSubscription = _useCase.checkAccessTokenStream().listen(
      (event) {
        log(event.toString(), name: "eventAccessRefresh");
        add(AppUserChanged());
      },
    );

    _refreshTokenSubscription = _useCase.checkRefreshTokenStream().listen(
      (event) {
        log(event.toString(), name: "eventRefresh");
        add(AppUserChanged());
      },
    );
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) {
    getIt<NotificationController>().initializeNotificationsEventListeners();
  }

  Future<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    final isLoggedIn = await _useCase.checkIsLoggedIn();
    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubscription.cancel();
    _refreshTokenSubscription.cancel();
    return super.close();
  }
}
