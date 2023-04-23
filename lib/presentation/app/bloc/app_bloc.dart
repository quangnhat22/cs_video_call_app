import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.authRepo}) : super(AppLoading()) {
    on<AppUserChanged>(_onAppUserChanged);

    // listen [accessToken] and [refreshToken] in local change
    _accessTokenSubcription = authRepo.checkAccessTokenStream().listen(
      (event) {
        log(event.toString(), name: "event");
        add(AppUserChanged());
      },
    );

    add(AppUserChanged());
  }

  final AuthRepository authRepo;
  late final StreamSubscription<String?> _accessTokenSubcription;

  Future<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    final isLoggedIn = await authRepo.checkIsLoggedIn();
    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubcription.cancel();
    return super.close();
  }
}
