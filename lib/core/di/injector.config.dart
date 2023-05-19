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
import 'package:videocall/core/services/notification_controller.dart' as _i28;
import 'package:videocall/core/services/notification_service.dart' as _i11;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i12;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i13;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i17;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i9;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i23;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i20;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i21;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i15;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i33;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i25;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i30;
import 'package:videocall/data/repositories/webrtc_repository.dart' as _i7;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i14;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i16;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i32;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i34;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i6;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i8;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i24;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i26;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i29;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i31;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i22;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i40;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i35;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i10;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i37;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i36;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i27;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i18;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i19;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i38;
import 'package:videocall/presentation/welcome/welcome.dart' as _i39;

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
    gh.factory<_i3.AssetFirebase>(() => _i3.AssetFirebase());
    gh.factory<_i4.AuthFirebase>(() => _i4.AuthFirebase());
    gh.lazySingleton<_i5.AuthLocalDataSrc>(() => _i5.AuthLocalDataSrc());
    gh.factory<_i6.CallRepository>(() => _i7.WebRTCRepositoryImpl());
    gh.factory<_i8.CallUseCase>(
        () => _i8.CallUseCaseImpl(callRepo: gh<_i6.CallRepository>()));
    gh.singleton<_i9.DioInterceptor>(
        _i9.DioInterceptor(gh<_i5.AuthLocalDataSrc>()));
    gh.factory<_i10.FindFriendFormCubit>(() => _i10.FindFriendFormCubit());
    gh.lazySingleton<_i11.NotificationService>(
        () => _i11.NotificationService());
    gh.lazySingleton<_i12.SettingLocalDataSrc>(
        () => _i12.SettingLocalDataSrc());
    gh.lazySingleton<_i13.UserLocalDataSrc>(() => _i13.UserLocalDataSrc());
    gh.factory<_i14.AppSettingsRepository>(() => _i15.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i12.SettingLocalDataSrc>()));
    gh.factory<_i16.AppSettingsUseCase>(() => _i16.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i14.AppSettingsRepository>()));
    gh.singleton<_i17.BaseService>(
        _i17.BaseService(interceptor: gh<_i9.DioInterceptor>()));
    gh.factory<_i18.EditLanguageCubit>(
        () => _i18.EditLanguageCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i19.EditThemeCubit>(
        () => _i19.EditThemeCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i20.FriendService>(
        () => _i20.FriendService(service: gh<_i17.BaseService>()));
    gh.lazySingleton<_i21.UserService>(
        () => _i21.UserService(service: gh<_i17.BaseService>()));
    gh.factory<_i22.AppSettingCubit>(
        () => _i22.AppSettingCubit(useCase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i23.AuthService>(
        () => _i23.AuthService(service: gh<_i17.BaseService>()));
    gh.factory<_i24.FriendRepository>(
        () => _i25.FriendRepositoryImpl(service: gh<_i20.FriendService>()));
    gh.factory<_i26.FriendUseCase>(
        () => _i26.FriendUseCaseImpl(friendRepo: gh<_i24.FriendRepository>()));
    gh.factory<_i27.ListFriendRequestBloc>(() =>
        _i27.ListFriendRequestBloc(friendUseCase: gh<_i26.FriendUseCase>()));
    gh.factory<_i28.NotificationController>(
        () => _i28.NotificationController(friendUC: gh<_i26.FriendUseCase>()));
    gh.factory<_i29.UserRepository>(() => _i30.UserRepositoryImpl(
          userService: gh<_i21.UserService>(),
          userLocal: gh<_i13.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i31.UserUseCase>(
        () => _i31.UserUseCaseImpl(repo: gh<_i29.UserRepository>()));
    gh.lazySingleton<_i32.AuthRepository>(() => _i33.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i23.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i11.NotificationService>(),
          userRepo: gh<_i29.UserRepository>(),
        ));
    gh.factory<_i34.AuthUseCase>(
        () => _i34.AuthUseCaeImpl(repo: gh<_i32.AuthRepository>()));
    gh.factory<_i35.FindFriendBloc>(
        () => _i35.FindFriendBloc(userRepo: gh<_i29.UserRepository>()));
    gh.factory<_i36.FriendRequestActionCubit>(() =>
        _i36.FriendRequestActionCubit(friendUseCase: gh<_i26.FriendUseCase>()));
    gh.factory<_i37.FriendsContactBloc>(() => _i37.FriendsContactBloc(
          useCase: gh<_i26.FriendUseCase>(),
          userUseCase: gh<_i31.UserUseCase>(),
        ));
    gh.factory<_i38.SettingCubit>(() => _i38.SettingCubit(
          authUseCase: gh<_i34.AuthUseCase>(),
          appSettingsUseCase: gh<_i16.AppSettingsUseCase>(),
        ));
    gh.factory<_i39.WelcomeCubit>(
        () => _i39.WelcomeCubit(authRepo: gh<_i32.AuthRepository>()));
    gh.lazySingleton<_i40.AppBloc>(() => _i40.AppBloc(
          authRepo: gh<_i32.AuthRepository>(),
          notificationControllerController: gh<_i28.NotificationController>(),
        ));
    return this;
  }
}
