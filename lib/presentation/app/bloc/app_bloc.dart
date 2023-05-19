import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

import '../../../core/services/notification_controller.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository authRepo;
  final NotificationController _notificationController;
  late final StreamSubscription<String?> _accessTokenSubscription;
  late final StreamSubscription<String?> _refreshTokenSubscription;

  AppBloc(
      {required this.authRepo,
      required NotificationController notificationControllerController})
      : _notificationController = notificationControllerController,
        super(AppLoading()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserChanged>(_onAppUserChanged);

    // listen [accessToken] and [refreshToken] in local change
    _accessTokenSubscription = authRepo.checkAccessTokenStream().listen(
      (event) {
        log(event.toString(), name: "eventAccessRefresh");
        add(AppUserChanged());
      },
    );

    _refreshTokenSubscription = authRepo.checkRefreshTokenStream().listen(
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
    final isLoggedIn = await authRepo.checkIsLoggedIn();
    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubscription.cancel();
    _refreshTokenSubscription.cancel();
    return super.close();
  }
}
