// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:videocall/core/services/notification_service.dart' as _i9;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i10;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i14;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i8;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i19;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i17;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i12;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i24;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i21;
import 'package:videocall/data/repositories/webrtc_repository.dart' as _i6;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i11;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i13;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i23;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i25;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i5;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i7;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i20;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i22;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i18;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i28;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i15;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i16;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i26;
import 'package:videocall/presentation/welcome/welcome.dart' as _i27;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthFirebase>(() => _i3.AuthFirebase());
    gh.lazySingleton<_i4.AuthLocalDataSrc>(() => _i4.AuthLocalDataSrc());
    gh.factory<_i5.CallRepository>(() => _i6.WebRTCRepositoryImpl());
    gh.factory<_i7.CallUseCase>(
        () => _i7.CallUseCaseImpl(callRepo: gh<_i5.CallRepository>()));
    gh.singleton<_i8.DioInterceptor>(
        _i8.DioInterceptor(gh<_i4.AuthLocalDataSrc>()));
    gh.lazySingleton<_i9.NotificationService>(() => _i9.NotificationService());
    gh.singleton<_i10.SettingLocalDataSrc>(_i10.SettingLocalDataSrc());
    gh.factory<_i11.AppSettingsRepository>(() => _i12.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i10.SettingLocalDataSrc>()));
    gh.factory<_i13.AppSettingsUseCase>(() => _i13.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i11.AppSettingsRepository>()));
    gh.singleton<_i14.BaseService>(
        _i14.BaseService(interceptor: gh<_i8.DioInterceptor>()));
    gh.factory<_i15.EditLanguageCubit>(
        () => _i15.EditLanguageCubit(usecase: gh<_i13.AppSettingsUseCase>()));
    gh.factory<_i16.EditThemeCubit>(
        () => _i16.EditThemeCubit(usecase: gh<_i13.AppSettingsUseCase>()));
    gh.lazySingleton<_i17.UserService>(
        () => _i17.UserService(service: gh<_i14.BaseService>()));
    gh.factory<_i18.AppSettingCubit>(
        () => _i18.AppSettingCubit(useCase: gh<_i13.AppSettingsUseCase>()));
    gh.factory<_i19.AuthService>(
        () => _i19.AuthService(service: gh<_i14.BaseService>()));
    gh.factory<_i20.UserRepository>(
        () => _i21.UserRepositoryImpl(userService: gh<_i17.UserService>()));
    gh.factory<_i22.UserUseCase>(
        () => _i22.UserUseCaseImpl(userRepo: gh<_i20.UserRepository>()));
    gh.lazySingleton<_i23.AuthRepository>(() => _i24.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i19.AuthService>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
          notificationService: gh<_i9.NotificationService>(),
        ));
    gh.factory<_i25.AuthUseCase>(
        () => _i25.AuthUseCaeImpl(repo: gh<_i23.AuthRepository>()));
    gh.factory<_i26.SettingCubit>(() => _i26.SettingCubit(
          authUseCase: gh<_i25.AuthUseCase>(),
          appSettingsUseCase: gh<_i13.AppSettingsUseCase>(),
        ));
    gh.factory<_i27.WelcomeCubit>(
        () => _i27.WelcomeCubit(authRepo: gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i28.AppBloc>(
        () => _i28.AppBloc(authRepo: gh<_i23.AuthRepository>()));
    return this;
  }
}
