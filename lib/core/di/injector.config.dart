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
import 'package:videocall/core/services/notification_controller.dart' as _i9;
import 'package:videocall/core/services/notification_service.dart' as _i10;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/firebase/personal_call_room_firebase.dart'
    as _i11;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i12;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i13;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i17;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i6;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i25;
import 'package:videocall/data/data_sources/remote/service/call_serivce.dart'
    as _i18;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i21;
import 'package:videocall/data/data_sources/remote/service/group_service.dart'
    as _i22;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i23;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i15;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i41;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i30;
import 'package:videocall/data/repositories/group_repository_impl.dart' as _i34;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i38;
import 'package:videocall/data/repositories/webrtc_repository_impl.dart'
    as _i27;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i14;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i16;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i40;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i42;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i26;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i28;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i29;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i31;
import 'package:videocall/domain/modules/group/group_repository.dart' as _i33;
import 'package:videocall/domain/modules/group/group_usecase.dart' as _i35;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i37;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i39;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i24;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i55;
import 'package:videocall/presentation/auth/avatar/cubit_avatar/avatar_cubit.dart'
    as _i43;
import 'package:videocall/presentation/auth/email_verify/cubit_send_email/send_email_cubit.dart'
    as _i51;
import 'package:videocall/presentation/auth/login/cubit/login_cubit.dart'
    as _i49;
import 'package:videocall/presentation/auth/profile/cubit_profile_form/profile_form_cubit.dart'
    as _i50;
import 'package:videocall/presentation/auth/sign_up/cubit_sign_up/sign_up_form_cubit.dart'
    as _i53;
import 'package:videocall/presentation/call/call_demo/cubit_call/call_cubit.dart'
    as _i44;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i46;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i48;
import 'package:videocall/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i32;
import 'package:videocall/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i47;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i36;
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart'
    as _i45;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i19;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i20;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i52;
import 'package:videocall/presentation/welcome/cubit/welcome_cubit.dart'
    as _i54;

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
    gh.singleton<_i6.DioInterceptor>(
        _i6.DioInterceptor(gh<_i5.AuthLocalDataSrc>()));
    gh.factory<_i7.FindFriendFormCubit>(() => _i7.FindFriendFormCubit());
    gh.factory<_i8.FriendInfoCubit>(() => _i8.FriendInfoCubit());
    gh.factory<_i9.NotificationController>(() => _i9.NotificationController());
    gh.lazySingleton<_i10.NotificationService>(
        () => _i10.NotificationService());
    gh.factory<_i11.PersonalCallRoomFirebase>(
        () => _i11.PersonalCallRoomFirebase());
    gh.lazySingleton<_i12.SettingLocalDataSrc>(
        () => _i12.SettingLocalDataSrc());
    gh.lazySingleton<_i13.UserLocalDataSrc>(() => _i13.UserLocalDataSrc());
    gh.factory<_i14.AppSettingsRepository>(() => _i15.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i12.SettingLocalDataSrc>()));
    gh.factory<_i16.AppSettingsUseCase>(() => _i16.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i14.AppSettingsRepository>()));
    gh.singleton<_i17.BaseService>(
        _i17.BaseService(interceptor: gh<_i6.DioInterceptor>()));
    gh.factory<_i18.CallService>(
        () => _i18.CallService(service: gh<_i17.BaseService>()));
    gh.factory<_i19.EditLanguageCubit>(
        () => _i19.EditLanguageCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i20.EditThemeCubit>(
        () => _i20.EditThemeCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i21.FriendService>(
        () => _i21.FriendService(service: gh<_i17.BaseService>()));
    gh.factory<_i22.GroupService>(
        () => _i22.GroupService(service: gh<_i17.BaseService>()));
    gh.lazySingleton<_i23.UserService>(
        () => _i23.UserService(service: gh<_i17.BaseService>()));
    gh.factory<_i24.AppSettingCubit>(
        () => _i24.AppSettingCubit(useCase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i25.AuthService>(
        () => _i25.AuthService(service: gh<_i17.BaseService>()));
    gh.factory<_i26.CallRepository>(() => _i27.WebRTCRepositoryImpl(
          callRoomFirebase: gh<_i11.PersonalCallRoomFirebase>(),
          callService: gh<_i18.CallService>(),
        ));
    gh.factory<_i28.CallUseCase>(() => _i28.CallUseCaseImpl(
          callRepo: gh<_i26.CallRepository>(),
          onAddRemoteStream: gh<_i28.StreamStateCallBack>(),
        ));
    gh.factory<_i29.FriendRepository>(
        () => _i30.FriendRepositoryImpl(service: gh<_i21.FriendService>()));
    gh.factory<_i31.FriendUseCase>(
        () => _i31.FriendUseCaseImpl(friendRepo: gh<_i29.FriendRepository>()));
    gh.factory<_i32.FriendsActionCubit>(
        () => _i32.FriendsActionCubit(friendUC: gh<_i31.FriendUseCase>()));
    gh.factory<_i33.GroupRepository>(
        () => _i34.GroupRepositoryImpl(service: gh<_i22.GroupService>()));
    gh.factory<_i35.GroupUseCase>(
        () => _i35.GroupUseCaseImpl(groupRepo: gh<_i33.GroupRepository>()));
    gh.factory<_i36.ListFriendRequestBloc>(() =>
        _i36.ListFriendRequestBloc(friendUseCase: gh<_i31.FriendUseCase>()));
    gh.factory<_i37.UserRepository>(() => _i38.UserRepositoryImpl(
          userService: gh<_i23.UserService>(),
          userLocal: gh<_i13.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i39.UserUseCase>(
        () => _i39.UserUseCaseImpl(repo: gh<_i37.UserRepository>()));
    gh.lazySingleton<_i40.AuthRepository>(() => _i41.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i25.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i10.NotificationService>(),
          userRepo: gh<_i37.UserRepository>(),
        ));
    gh.factory<_i42.AuthUseCase>(
        () => _i42.AuthUseCaeImpl(repo: gh<_i40.AuthRepository>()));
    gh.factory<_i43.AvatarCubit>(
        () => _i43.AvatarCubit(userUc: gh<_i39.UserUseCase>()));
    gh.factory<_i44.CallCubit>(
        () => _i44.CallCubit(callUC: gh<_i28.CallUseCase>()));
    gh.factory<_i45.CreateGroupCubit>(
        () => _i45.CreateGroupCubit(groupUseCase: gh<_i35.GroupUseCase>()));
    gh.factory<_i46.FindFriendBloc>(
        () => _i46.FindFriendBloc(userRepo: gh<_i37.UserRepository>()));
    gh.factory<_i47.FriendRequestActionCubit>(() =>
        _i47.FriendRequestActionCubit(friendUseCase: gh<_i31.FriendUseCase>()));
    gh.factory<_i48.FriendsContactBloc>(() => _i48.FriendsContactBloc(
          useCase: gh<_i31.FriendUseCase>(),
          userUseCase: gh<_i39.UserUseCase>(),
        ));
    gh.factory<_i49.LoginCubit>(
        () => _i49.LoginCubit(authUseCase: gh<_i42.AuthUseCase>()));
    gh.factory<_i50.ProfileFormCubit>(
        () => _i50.ProfileFormCubit(userUC: gh<_i39.UserUseCase>()));
    gh.factory<_i51.SendEmailCubit>(
        () => _i51.SendEmailCubit(authUseCase: gh<_i42.AuthUseCase>()));
    gh.factory<_i52.SettingCubit>(() => _i52.SettingCubit(
          authUseCase: gh<_i42.AuthUseCase>(),
          userUseCase: gh<_i39.UserUseCase>(),
          appSettingsUseCase: gh<_i16.AppSettingsUseCase>(),
        ));
    gh.factory<_i53.SignUpFormCubit>(
        () => _i53.SignUpFormCubit(authRepo: gh<_i40.AuthRepository>()));
    gh.factory<_i54.WelcomeCubit>(
        () => _i54.WelcomeCubit(authRepo: gh<_i40.AuthRepository>()));
    gh.lazySingleton<_i55.AppBloc>(
        () => _i55.AppBloc(authUC: gh<_i42.AuthUseCase>()));
    return this;
  }
}
