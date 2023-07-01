// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:awesome_notifications/awesome_notifications.dart' as _i18;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter_bloc/flutter_bloc.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:videocall/common/widgets/stateless/app_bar/m_app_bar.dart'
    as _i13;
import 'package:videocall/core/services/notification_controller.dart' as _i15;
import 'package:videocall/core/services/notification_service.dart' as _i16;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/firebase/personal_call_room_firebase.dart'
    as _i19;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i20;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i21;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i25;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i7;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i39;
import 'package:videocall/data/data_sources/remote/service/call_group_service.dart'
    as _i26;
import 'package:videocall/data/data_sources/remote/service/call_serivce.dart'
    as _i27;
import 'package:videocall/data/data_sources/remote/service/device_service.dart'
    as _i28;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i31;
import 'package:videocall/data/data_sources/remote/service/group_service.dart'
    as _i32;
import 'package:videocall/data/data_sources/remote/service/search_service.dart'
    as _i36;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i37;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i23;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i66;
import 'package:videocall/data/repositories/call_group_repository_impl.dart'
    as _i34;
import 'package:videocall/data/repositories/device_repository_impl.dart'
    as _i44;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i48;
import 'package:videocall/data/repositories/group_repository_impl.dart' as _i53;
import 'package:videocall/data/repositories/search_repository_impl.dart'
    as _i60;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i63;
import 'package:videocall/data/repositories/webrtc_repository_impl.dart'
    as _i41;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i22;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i24;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i65;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i67;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i40;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i42;
import 'package:videocall/domain/modules/call/livekit_call_repository.dart'
    as _i33;
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart'
    as _i35;
import 'package:videocall/domain/modules/device/device_repository.dart' as _i43;
import 'package:videocall/domain/modules/device/device_usecase.dart' as _i45;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i47;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i49;
import 'package:videocall/domain/modules/group/group_repository.dart' as _i52;
import 'package:videocall/domain/modules/group/group_usecase.dart' as _i54;
import 'package:videocall/domain/modules/search/search_repository.dart' as _i59;
import 'package:videocall/domain/modules/search/search_usecase.dart' as _i61;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i62;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i64;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i38;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i84;
import 'package:videocall/presentation/auth/avatar/cubit_avatar/avatar_cubit.dart'
    as _i68;
import 'package:videocall/presentation/auth/email_verify/cubit_send_email/send_email_cubit.dart'
    as _i79;
import 'package:videocall/presentation/auth/forgot_password/cubit/send_email_cubit.dart'
    as _i80;
import 'package:videocall/presentation/auth/login/cubit/login_cubit.dart'
    as _i77;
import 'package:videocall/presentation/auth/profile/cubit_profile_form/profile_form_cubit.dart'
    as _i78;
import 'package:videocall/presentation/auth/sign_up/cubit_sign_up/sign_up_form_cubit.dart'
    as _i82;
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart'
    as _i6;
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart'
    as _i58;
import 'package:videocall/presentation/call/personal_call/page/personal_call_page.dart'
    as _i17;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i71;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i8;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i73;
import 'package:videocall/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i50;
import 'package:videocall/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i9;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i72;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i55;
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart'
    as _i12;
import 'package:videocall/presentation/global_search/global_search.dart'
    as _i10;
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart'
    as _i69;
import 'package:videocall/presentation/groups/group_list/bloc/group_list_bloc.dart'
    as _i75;
import 'package:videocall/presentation/groups/group_requests/group_request_action_cubit/group_request_action_cubit.dart'
    as _i76;
import 'package:videocall/presentation/groups/group_requests/list_group_request_bloc/list_group_request_bloc.dart'
    as _i56;
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart'
    as _i74;
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart'
    as _i51;
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart'
    as _i57;
import 'package:videocall/presentation/setting/devices/bloc/devices_bloc.dart'
    as _i46;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i29;
import 'package:videocall/presentation/setting/edit_profile/cubit/edit_profile_cubit.dart'
    as _i70;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i30;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i81;
import 'package:videocall/presentation/welcome/cubit/welcome_cubit.dart'
    as _i83;

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
    gh.factory<_i6.CallGroupStatusCubit>(() => _i6.CallGroupStatusCubit());
    gh.singleton<_i7.DioInterceptor>(
        _i7.DioInterceptor(gh<_i5.AuthLocalDataSrc>()));
    gh.factory<_i8.FindFriendFormCubit>(() => _i8.FindFriendFormCubit());
    gh.factory<_i9.FriendInfoCubit>(() => _i9.FriendInfoCubit());
    gh.factory<_i10.GlobalSearch>(() => _i10.GlobalSearch(
        gh<_i11.Bloc<_i12.GlobalSearchEvent, _i12.GlobalSearchState>>()));
    gh.factory<_i13.MHomeAppBar>(() => _i13.MHomeAppBar(
          key: gh<_i14.Key>(),
          title: gh<String>(),
          bottomWidget: gh<_i14.PreferredSizeWidget>(),
          numberNotification: gh<int>(),
          actionButton: gh<_i14.Widget>(),
        ));
    gh.factory<_i15.NotificationController>(
        () => _i15.NotificationController());
    gh.lazySingleton<_i16.NotificationService>(
        () => _i16.NotificationService());
    gh.factory<_i17.PersonalCallPage>(() => _i17.PersonalCallPage(
          key: gh<_i14.Key>(),
          receivedAction: gh<_i18.ReceivedAction>(),
          friendId: gh<String>(),
        ));
    gh.factory<_i19.PersonalCallRoomFirebase>(
        () => _i19.PersonalCallRoomFirebase());
    gh.lazySingleton<_i20.SettingLocalDataSrc>(
        () => _i20.SettingLocalDataSrc());
    gh.lazySingleton<_i21.UserLocalDataSrc>(() => _i21.UserLocalDataSrc());
    gh.factory<_i22.AppSettingsRepository>(() => _i23.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i20.SettingLocalDataSrc>()));
    gh.factory<_i24.AppSettingsUseCase>(() => _i24.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i22.AppSettingsRepository>()));
    gh.singleton<_i25.BaseService>(
        _i25.BaseService(interceptor: gh<_i7.DioInterceptor>()));
    gh.factory<_i26.CallGroupService>(
        () => _i26.CallGroupService(service: gh<_i25.BaseService>()));
    gh.factory<_i27.CallService>(
        () => _i27.CallService(service: gh<_i25.BaseService>()));
    gh.factory<_i28.DeviceService>(
        () => _i28.DeviceService(service: gh<_i25.BaseService>()));
    gh.factory<_i29.EditLanguageCubit>(
        () => _i29.EditLanguageCubit(usecase: gh<_i24.AppSettingsUseCase>()));
    gh.factory<_i30.EditThemeCubit>(
        () => _i30.EditThemeCubit(usecase: gh<_i24.AppSettingsUseCase>()));
    gh.factory<_i31.FriendService>(
        () => _i31.FriendService(service: gh<_i25.BaseService>()));
    gh.factory<_i32.GroupService>(
        () => _i32.GroupService(service: gh<_i25.BaseService>()));
    gh.factory<_i33.LiveKitCallRepository>(() => _i34.CallGroupRepositoryImpl(
        callGroupService: gh<_i26.CallGroupService>()));
    gh.factory<_i35.LiveKitCallUseCase>(() => _i35.LiveKitCallUseCaseImpl(
        callGroupRepo: gh<_i33.LiveKitCallRepository>()));
    gh.factory<_i36.SearchService>(
        () => _i36.SearchService(service: gh<_i25.BaseService>()));
    gh.lazySingleton<_i37.UserService>(
        () => _i37.UserService(service: gh<_i25.BaseService>()));
    gh.factory<_i38.AppSettingCubit>(
        () => _i38.AppSettingCubit(useCase: gh<_i24.AppSettingsUseCase>()));
    gh.factory<_i39.AuthService>(
        () => _i39.AuthService(service: gh<_i25.BaseService>()));
    gh.factory<_i40.CallRepository>(() => _i41.WebRTCRepositoryImpl(
          callRoomFirebase: gh<_i19.PersonalCallRoomFirebase>(),
          callService: gh<_i27.CallService>(),
        ));
    gh.factory<_i42.CallUseCase>(
        () => _i42.CallUseCaseImpl(callRepo: gh<_i40.CallRepository>()));
    gh.factory<_i43.DeviceRepository>(() =>
        _i44.DeviceRepositoryImpl(deviceService: gh<_i28.DeviceService>()));
    gh.factory<_i45.DeviceUseCase>(() =>
        _i45.DeviceUseCaseImpl(deviceRepository: gh<_i43.DeviceRepository>()));
    gh.factory<_i46.DevicesBloc>(
        () => _i46.DevicesBloc(deviceUseCase: gh<_i45.DeviceUseCase>()));
    gh.factory<_i47.FriendRepository>(
        () => _i48.FriendRepositoryImpl(service: gh<_i31.FriendService>()));
    gh.factory<_i49.FriendUseCase>(
        () => _i49.FriendUseCaseImpl(friendRepo: gh<_i47.FriendRepository>()));
    gh.factory<_i50.FriendsActionCubit>(
        () => _i50.FriendsActionCubit(friendUC: gh<_i49.FriendUseCase>()));
    gh.factory<_i51.GroupMeetingCubit>(() =>
        _i51.GroupMeetingCubit(liveKitCallUC: gh<_i35.LiveKitCallUseCase>()));
    gh.factory<_i52.GroupRepository>(() => _i53.GroupRepositoryImpl(
          service: gh<_i32.GroupService>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i54.GroupUseCase>(
        () => _i54.GroupUseCaseImpl(groupRepo: gh<_i52.GroupRepository>()));
    gh.factory<_i55.ListFriendRequestBloc>(() =>
        _i55.ListFriendRequestBloc(friendUseCase: gh<_i49.FriendUseCase>()));
    gh.factory<_i56.ListGroupRequestBloc>(
        () => _i56.ListGroupRequestBloc(groupUseCase: gh<_i54.GroupUseCase>()));
    gh.factory<_i57.NewMemberCubit>(() => _i57.NewMemberCubit(
          friendUC: gh<_i49.FriendUseCase>(),
          groupUC: gh<_i54.GroupUseCase>(),
        ));
    gh.factory<_i58.PersonalCallCubit>(
        () => _i58.PersonalCallCubit(callUC: gh<_i42.CallUseCase>()));
    gh.factory<_i59.SearchRepository>(
        () => _i60.SearchRepositoryImpl(service: gh<_i36.SearchService>()));
    gh.factory<_i61.SearchUseCase>(
        () => _i61.SearchUseCaseImpl(repo: gh<_i59.SearchRepository>()));
    gh.factory<_i62.UserRepository>(() => _i63.UserRepositoryImpl(
          userService: gh<_i37.UserService>(),
          userLocal: gh<_i21.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i64.UserUseCase>(
        () => _i64.UserUseCaseImpl(repo: gh<_i62.UserRepository>()));
    gh.lazySingleton<_i65.AuthRepository>(() => _i66.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i39.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i16.NotificationService>(),
          userRepo: gh<_i62.UserRepository>(),
        ));
    gh.factory<_i67.AuthUseCase>(
        () => _i67.AuthUseCaeImpl(repo: gh<_i65.AuthRepository>()));
    gh.factory<_i68.AvatarCubit>(
        () => _i68.AvatarCubit(userUc: gh<_i64.UserUseCase>()));
    gh.factory<_i69.CreateGroupCubit>(
        () => _i69.CreateGroupCubit(groupUseCase: gh<_i54.GroupUseCase>()));
    gh.factory<_i70.EditProfileCubit>(
        () => _i70.EditProfileCubit(userUseCase: gh<_i64.UserUseCase>()));
    gh.factory<_i71.FindFriendBloc>(
        () => _i71.FindFriendBloc(userRepo: gh<_i62.UserRepository>()));
    gh.factory<_i72.FriendRequestActionCubit>(() =>
        _i72.FriendRequestActionCubit(friendUseCase: gh<_i49.FriendUseCase>()));
    gh.factory<_i73.FriendsContactBloc>(() => _i73.FriendsContactBloc(
          useCase: gh<_i49.FriendUseCase>(),
          userUseCase: gh<_i64.UserUseCase>(),
        ));
    gh.factory<_i12.GlobalSearchBloc>(
        () => _i12.GlobalSearchBloc(searchUseCase: gh<_i61.SearchUseCase>()));
    gh.factory<_i74.GroupDetailBloc>(
        () => _i74.GroupDetailBloc(groupUC: gh<_i54.GroupUseCase>()));
    gh.factory<_i75.GroupListBloc>(
        () => _i75.GroupListBloc(useCase: gh<_i54.GroupUseCase>()));
    gh.factory<_i76.GroupRequestActionCubit>(() =>
        _i76.GroupRequestActionCubit(groupUseCase: gh<_i54.GroupUseCase>()));
    gh.factory<_i77.LoginCubit>(
        () => _i77.LoginCubit(authUseCase: gh<_i67.AuthUseCase>()));
    gh.factory<_i78.ProfileFormCubit>(
        () => _i78.ProfileFormCubit(userUC: gh<_i64.UserUseCase>()));
    gh.factory<_i79.SendEmailCubit>(
        () => _i79.SendEmailCubit(authUseCase: gh<_i67.AuthUseCase>()));
    gh.factory<_i80.SendEmailCubit>(
        () => _i80.SendEmailCubit(authUseCase: gh<_i67.AuthUseCase>()));
    gh.factory<_i81.SettingCubit>(() => _i81.SettingCubit(
          authUseCase: gh<_i67.AuthUseCase>(),
          userUseCase: gh<_i64.UserUseCase>(),
          appSettingsUseCase: gh<_i24.AppSettingsUseCase>(),
        ));
    gh.factory<_i82.SignUpFormCubit>(
        () => _i82.SignUpFormCubit(authRepo: gh<_i65.AuthRepository>()));
    gh.factory<_i83.WelcomeCubit>(
        () => _i83.WelcomeCubit(authRepo: gh<_i65.AuthRepository>()));
    gh.lazySingleton<_i84.AppBloc>(
        () => _i84.AppBloc(authUC: gh<_i67.AuthUseCase>()));
    return this;
  }
}
