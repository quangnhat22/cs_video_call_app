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
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i8;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i5;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i10;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i9;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i12;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i11;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i13;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i7;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i6;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i16;
import 'package:videocall/presentation/setting/setting_dash_board/setting_dash_board.dart'
    as _i14;
import 'package:videocall/presentation/welcome/welcome.dart' as _i15;

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
    gh.factory<_i6.UserUseCase>(
        () => _i6.UserUseCaseImpl(userRepo: gh<_i7.UserRepository>()));
    gh.singleton<_i8.BaseService>(_i8.BaseService(
      authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
      interceptor: gh<_i5.DioInterceptor>(),
    ));
    gh.lazySingleton<_i9.UserService>(
        () => _i9.UserService(service: gh<_i8.BaseService>()));
    gh.lazySingleton<_i10.AuthService>(
        () => _i10.AuthService(service: gh<_i8.BaseService>()));
    gh.factory<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i10.AuthService>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i13.AuthUseCase>(
        () => _i13.AuthUseCaeImpl(repo: gh<_i11.AuthRepository>()));
    gh.factory<_i14.SettingCubit>(
        () => _i14.SettingCubit(authRepo: gh<_i11.AuthRepository>()));
    gh.factory<_i15.WelcomeCubit>(
        () => _i15.WelcomeCubit(authRepo: gh<_i11.AuthRepository>()));
    gh.lazySingleton<_i16.AppBloc>(
        () => _i16.AppBloc(authRepo: gh<_i11.AuthRepository>()));
    return this;
  }
}
