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
import 'package:videocall/core/services/notification_controller.dart' as _i30;
import 'package:videocall/core/services/notification_service.dart' as _i12;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i13;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i14;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i18;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i9;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i24;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i21;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i22;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i16;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i35;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i26;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i32;
import 'package:videocall/data/repositories/webrtc_repository.dart' as _i7;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i15;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i17;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i34;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i36;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i6;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i8;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i25;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i27;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i31;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i33;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i23;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i42;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i37;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i10;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i39;
import 'package:videocall/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i28;
import 'package:videocall/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i11;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i38;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i29;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i19;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i20;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i40;
import 'package:videocall/presentation/welcome/welcome.dart' as _i41;

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
    gh.factory<_i11.FriendInfoCubit>(() => _i11.FriendInfoCubit());
    gh.lazySingleton<_i12.NotificationService>(
        () => _i12.NotificationService());
    gh.lazySingleton<_i13.SettingLocalDataSrc>(
        () => _i13.SettingLocalDataSrc());
    gh.lazySingleton<_i14.UserLocalDataSrc>(() => _i14.UserLocalDataSrc());
    gh.factory<_i15.AppSettingsRepository>(() => _i16.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i13.SettingLocalDataSrc>()));
    gh.factory<_i17.AppSettingsUseCase>(() => _i17.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i15.AppSettingsRepository>()));
    gh.singleton<_i18.BaseService>(
        _i18.BaseService(interceptor: gh<_i9.DioInterceptor>()));
    gh.factory<_i19.EditLanguageCubit>(
        () => _i19.EditLanguageCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i20.EditThemeCubit>(
        () => _i20.EditThemeCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i21.FriendService>(
        () => _i21.FriendService(service: gh<_i18.BaseService>()));
    gh.lazySingleton<_i22.UserService>(
        () => _i22.UserService(service: gh<_i18.BaseService>()));
    gh.factory<_i23.AppSettingCubit>(
        () => _i23.AppSettingCubit(useCase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i24.AuthService>(
        () => _i24.AuthService(service: gh<_i18.BaseService>()));
    gh.factory<_i25.FriendRepository>(
        () => _i26.FriendRepositoryImpl(service: gh<_i21.FriendService>()));
    gh.factory<_i27.FriendUseCase>(
        () => _i27.FriendUseCaseImpl(friendRepo: gh<_i25.FriendRepository>()));
    gh.factory<_i28.FriendsActionCubit>(
        () => _i28.FriendsActionCubit(friendUC: gh<_i27.FriendUseCase>()));
    gh.factory<_i29.ListFriendRequestBloc>(() =>
        _i29.ListFriendRequestBloc(friendUseCase: gh<_i27.FriendUseCase>()));
    gh.factory<_i30.NotificationController>(
        () => _i30.NotificationController(friendUC: gh<_i27.FriendUseCase>()));
    gh.factory<_i31.UserRepository>(() => _i32.UserRepositoryImpl(
          userService: gh<_i22.UserService>(),
          userLocal: gh<_i14.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i33.UserUseCase>(
        () => _i33.UserUseCaseImpl(repo: gh<_i31.UserRepository>()));
    gh.lazySingleton<_i34.AuthRepository>(() => _i35.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i24.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i12.NotificationService>(),
          userRepo: gh<_i31.UserRepository>(),
        ));
    gh.factory<_i36.AuthUseCase>(
        () => _i36.AuthUseCaeImpl(repo: gh<_i34.AuthRepository>()));
    gh.factory<_i37.FindFriendBloc>(
        () => _i37.FindFriendBloc(userRepo: gh<_i31.UserRepository>()));
    gh.factory<_i38.FriendRequestActionCubit>(() =>
        _i38.FriendRequestActionCubit(friendUseCase: gh<_i27.FriendUseCase>()));
    gh.factory<_i39.FriendsContactBloc>(() => _i39.FriendsContactBloc(
          useCase: gh<_i27.FriendUseCase>(),
          userUseCase: gh<_i33.UserUseCase>(),
        ));
    gh.factory<_i40.SettingCubit>(() => _i40.SettingCubit(
          authUseCase: gh<_i36.AuthUseCase>(),
          appSettingsUseCase: gh<_i17.AppSettingsUseCase>(),
        ));
    gh.factory<_i41.WelcomeCubit>(
        () => _i41.WelcomeCubit(authRepo: gh<_i34.AuthRepository>()));
    gh.lazySingleton<_i42.AppBloc>(() => _i42.AppBloc(
          authRepo: gh<_i34.AuthRepository>(),
          notificationControllerController: gh<_i30.NotificationController>(),
        ));
    return this;
  }
}
