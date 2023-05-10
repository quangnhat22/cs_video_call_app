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
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i6;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i10;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i5;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i15;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i13;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i8;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i20;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i17;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i7;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i9;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i19;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i21;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i16;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i18;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i14;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i24;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i11;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i12;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i22;
import 'package:videocall/presentation/welcome/welcome.dart' as _i23;

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
    gh.singleton<_i4.AuthLocalDataSrc>(_i4.AuthLocalDataSrc());
    gh.singleton<_i5.DioInterceptor>(
        _i5.DioInterceptor(gh<_i4.AuthLocalDataSrc>()));
    gh.singleton<_i6.SettingLocalDataSrc>(_i6.SettingLocalDataSrc());
    gh.factory<_i7.AppSettingsRepository>(() => _i8.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i6.SettingLocalDataSrc>()));
    gh.factory<_i9.AppSettingsUseCase>(() => _i9.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i7.AppSettingsRepository>()));
    gh.singleton<_i10.BaseService>(
        _i10.BaseService(interceptor: gh<_i5.DioInterceptor>()));
    gh.factory<_i11.EditLanguageCubit>(
        () => _i11.EditLanguageCubit(usecase: gh<_i9.AppSettingsUseCase>()));
    gh.factory<_i12.EditThemeCubit>(
        () => _i12.EditThemeCubit(usecase: gh<_i9.AppSettingsUseCase>()));
    gh.lazySingleton<_i13.UserService>(
        () => _i13.UserService(service: gh<_i10.BaseService>()));
    gh.factory<_i14.AppSettingCubit>(
        () => _i14.AppSettingCubit(useCase: gh<_i9.AppSettingsUseCase>()));
    gh.lazySingleton<_i15.AuthService>(
        () => _i15.AuthService(service: gh<_i10.BaseService>()));
    gh.factory<_i16.UserRepository>(
        () => _i17.UserRepositoryImpl(userService: gh<_i13.UserService>()));
    gh.factory<_i18.UserUseCase>(
        () => _i18.UserUseCaseImpl(userRepo: gh<_i16.UserRepository>()));
    gh.factory<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i15.AuthService>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i21.AuthUseCase>(
        () => _i21.AuthUseCaeImpl(repo: gh<_i19.AuthRepository>()));
    gh.factory<_i22.SettingCubit>(() => _i22.SettingCubit(
          authUseCase: gh<_i21.AuthUseCase>(),
          appSettingsUseCase: gh<_i9.AppSettingsUseCase>(),
        ));
    gh.factory<_i23.WelcomeCubit>(
        () => _i23.WelcomeCubit(authRepo: gh<_i19.AuthRepository>()));
    gh.lazySingleton<_i24.AppBloc>(
        () => _i24.AppBloc(authRepo: gh<_i19.AuthRepository>()));
    return this;
  }
}
