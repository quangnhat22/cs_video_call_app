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
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i11;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i9;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i12;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i7;
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart'
    as _i6;
import 'package:videocall/domain/modules/auth/usecases/auth_usecase.dart'
    as _i8;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i3;
import 'package:videocall/presentation/welcome/welcome.dart' as _i10;

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
    gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
    gh.factory<_i4.AuthFirebase>(() => _i4.AuthFirebase());
    gh.lazySingleton<_i5.AuthLocalDataSrc>(() => _i5.AuthLocalDataSrc());
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(authFirebase: gh<_i4.AuthFirebase>()));
    gh.factory<_i8.AuthUseCase>(
        () => _i8.AuthUseCaeImpl(repo: gh<_i6.AuthRepository>()));
    gh.singleton<_i9.DioInterceptor>(
        _i9.DioInterceptor(gh<_i5.AuthLocalDataSrc>()));
    gh.factory<_i10.WelcomeCubit>(
        () => _i10.WelcomeCubit(authRepo: gh<_i6.AuthRepository>()));
    gh.singleton<_i11.BaseService>(_i11.BaseService(
      authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
      interceptor: gh<_i9.DioInterceptor>(),
    ));
    gh.lazySingleton<_i12.AuthService>(
        () => _i12.AuthService(service: gh<_i11.BaseService>()));
    return this;
  }
}
