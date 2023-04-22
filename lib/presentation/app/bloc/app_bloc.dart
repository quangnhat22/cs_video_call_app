import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.authRepo}) : super(AppUnAuthorized()) {
    on<AppUserChanged>(_onAppUserChanged);
    
    add(AppUserChanged());
  }

  final AuthRepository authRepo;

  Future<void> _onAppUserChanged(AppUserChanged event, Emitter<AppState> emit) async {
    final isLoggedIn = await authRepo.checkIsLoggedIn();
    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }
}
