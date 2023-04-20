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
import 'package:videocall/modules/auth/auth_services/app_auth_services.dart'
    as _i5;
import 'package:videocall/modules/auth/auth_services/auth_serivces.dart' as _i4;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i3;
import 'package:videocall/presentation/welcome/welcome.dart' as _i6;

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
    gh.factory<_i4.AuthServices>(() => _i5.AppAuthServices());
    gh.factory<_i6.WelcomeCubit>(
        () => _i6.WelcomeCubit(authServices: gh<_i4.AuthServices>()));
    return this;
  }
}
