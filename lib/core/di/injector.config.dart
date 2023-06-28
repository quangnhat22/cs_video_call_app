// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:awesome_notifications/awesome_notifications.dart' as _i14;
import 'package:flutter/material.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:videocall/common/widgets/stateless/app_bar/m_app_bar.dart'
    as _i70;
import 'package:videocall/core/services/notification_controller.dart' as _i10;
import 'package:videocall/core/services/notification_service.dart' as _i11;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/firebase/personal_call_room_firebase.dart'
    as _i15;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i16;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i17;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i21;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i7;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i34;
import 'package:videocall/data/data_sources/remote/service/call_group_service.dart'
    as _i22;
import 'package:videocall/data/data_sources/remote/service/call_serivce.dart'
    as _i23;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i26;
import 'package:videocall/data/data_sources/remote/service/group_service.dart'
    as _i27;
import 'package:videocall/data/data_sources/remote/service/search_service.dart'
    as _i31;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i32;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i19;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i57;
import 'package:videocall/data/repositories/call_group_repository_impl.dart'
    as _i29;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i39;
import 'package:videocall/data/repositories/group_repository_impl.dart' as _i44;
import 'package:videocall/data/repositories/search_repository_impl.dart'
    as _i51;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i54;
import 'package:videocall/data/repositories/webrtc_repository_impl.dart'
    as _i36;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i18;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i20;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i56;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i58;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i35;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i37;
import 'package:videocall/domain/modules/call/livekit_call_repository.dart'
    as _i28;
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart'
    as _i30;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i38;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i40;
import 'package:videocall/domain/modules/group/group_repository.dart' as _i43;
import 'package:videocall/domain/modules/group/group_usecase.dart' as _i45;
import 'package:videocall/domain/modules/search/search_repository.dart' as _i50;
import 'package:videocall/domain/modules/search/search_usecase.dart' as _i52;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i53;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i55;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i33;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i76;
import 'package:videocall/presentation/auth/avatar/cubit_avatar/avatar_cubit.dart'
    as _i59;
import 'package:videocall/presentation/auth/email_verify/cubit_send_email/send_email_cubit.dart'
    as _i72;
import 'package:videocall/presentation/auth/login/cubit/login_cubit.dart'
    as _i69;
import 'package:videocall/presentation/auth/profile/cubit_profile_form/profile_form_cubit.dart'
    as _i71;
import 'package:videocall/presentation/auth/sign_up/cubit_sign_up/sign_up_form_cubit.dart'
    as _i74;
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart'
    as _i6;
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart'
    as _i49;
import 'package:videocall/presentation/call/personal_call/page/personal_call_page.dart'
    as _i12;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i62;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i8;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i64;
import 'package:videocall/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i41;
import 'package:videocall/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i9;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i63;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i46;
import 'package:videocall/presentation/global_search/global_search.dart'
    as _i65;
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart'
    as _i60;
import 'package:videocall/presentation/groups/group_list/bloc/group_list_bloc.dart'
    as _i67;
import 'package:videocall/presentation/groups/group_requests/group_request_action_cubit/group_request_action_cubit.dart'
    as _i68;
import 'package:videocall/presentation/groups/group_requests/list_group_request_bloc/list_group_request_bloc.dart'
    as _i47;
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart'
    as _i66;
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart'
    as _i42;
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart'
    as _i48;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i24;
import 'package:videocall/presentation/setting/edit_profile/cubit/edit_profile_cubit.dart'
    as _i61;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i25;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i73;
import 'package:videocall/presentation/welcome/cubit/welcome_cubit.dart'
    as _i75;

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
    gh.factory<_i10.NotificationController>(
        () => _i10.NotificationController());
    gh.lazySingleton<_i11.NotificationService>(
        () => _i11.NotificationService());
    gh.factory<_i12.PersonalCallPage>(() => _i12.PersonalCallPage(
          key: gh<_i13.Key>(),
          receivedAction: gh<_i14.ReceivedAction>(),
          friendId: gh<String>(),
        ));
    gh.factory<_i15.PersonalCallRoomFirebase>(
        () => _i15.PersonalCallRoomFirebase());
    gh.lazySingleton<_i16.SettingLocalDataSrc>(
        () => _i16.SettingLocalDataSrc());
    gh.lazySingleton<_i17.UserLocalDataSrc>(() => _i17.UserLocalDataSrc());
    gh.factory<_i18.AppSettingsRepository>(() => _i19.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i16.SettingLocalDataSrc>()));
    gh.factory<_i20.AppSettingsUseCase>(() => _i20.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i18.AppSettingsRepository>()));
    gh.singleton<_i21.BaseService>(
        _i21.BaseService(interceptor: gh<_i7.DioInterceptor>()));
    gh.factory<_i22.CallGroupService>(
        () => _i22.CallGroupService(service: gh<_i21.BaseService>()));
    gh.factory<_i23.CallService>(
        () => _i23.CallService(service: gh<_i21.BaseService>()));
    gh.factory<_i24.EditLanguageCubit>(
        () => _i24.EditLanguageCubit(usecase: gh<_i20.AppSettingsUseCase>()));
    gh.factory<_i25.EditThemeCubit>(
        () => _i25.EditThemeCubit(usecase: gh<_i20.AppSettingsUseCase>()));
    gh.factory<_i26.FriendService>(
        () => _i26.FriendService(service: gh<_i21.BaseService>()));
    gh.factory<_i27.GroupService>(
        () => _i27.GroupService(service: gh<_i21.BaseService>()));
    gh.factory<_i28.LiveKitCallRepository>(() => _i29.CallGroupRepositoryImpl(
        callGroupService: gh<_i22.CallGroupService>()));
    gh.factory<_i30.LiveKitCallUseCase>(() => _i30.LiveKitCallUseCaseImpl(
        callGroupRepo: gh<_i28.LiveKitCallRepository>()));
    gh.factory<_i31.SearchService>(
        () => _i31.SearchService(service: gh<_i21.BaseService>()));
    gh.lazySingleton<_i32.UserService>(
        () => _i32.UserService(service: gh<_i21.BaseService>()));
    gh.factory<_i33.AppSettingCubit>(
        () => _i33.AppSettingCubit(useCase: gh<_i20.AppSettingsUseCase>()));
    gh.factory<_i34.AuthService>(
        () => _i34.AuthService(service: gh<_i21.BaseService>()));
    gh.factory<_i35.CallRepository>(() => _i36.WebRTCRepositoryImpl(
          callRoomFirebase: gh<_i15.PersonalCallRoomFirebase>(),
          callService: gh<_i23.CallService>(),
        ));
    gh.factory<_i37.CallUseCase>(
        () => _i37.CallUseCaseImpl(callRepo: gh<_i35.CallRepository>()));
    gh.factory<_i38.FriendRepository>(
        () => _i39.FriendRepositoryImpl(service: gh<_i26.FriendService>()));
    gh.factory<_i40.FriendUseCase>(
        () => _i40.FriendUseCaseImpl(friendRepo: gh<_i38.FriendRepository>()));
    gh.factory<_i41.FriendsActionCubit>(
        () => _i41.FriendsActionCubit(friendUC: gh<_i40.FriendUseCase>()));
    gh.factory<_i42.GroupMeetingCubit>(() =>
        _i42.GroupMeetingCubit(liveKitCallUC: gh<_i30.LiveKitCallUseCase>()));
    gh.factory<_i43.GroupRepository>(() => _i44.GroupRepositoryImpl(
          service: gh<_i27.GroupService>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i45.GroupUseCase>(
        () => _i45.GroupUseCaseImpl(groupRepo: gh<_i43.GroupRepository>()));
    gh.factory<_i46.ListFriendRequestBloc>(() =>
        _i46.ListFriendRequestBloc(friendUseCase: gh<_i40.FriendUseCase>()));
    gh.factory<_i47.ListGroupRequestBloc>(
        () => _i47.ListGroupRequestBloc(groupUseCase: gh<_i45.GroupUseCase>()));
    gh.factory<_i48.NewMemberCubit>(() => _i48.NewMemberCubit(
          friendUC: gh<_i40.FriendUseCase>(),
          groupUC: gh<_i45.GroupUseCase>(),
        ));
    gh.factory<_i49.PersonalCallCubit>(
        () => _i49.PersonalCallCubit(callUC: gh<_i37.CallUseCase>()));
    gh.factory<_i50.SearchRepository>(
        () => _i51.SearchRepositoryImpl(service: gh<_i31.SearchService>()));
    gh.factory<_i52.SearchUseCase>(
        () => _i52.SearchUseCaseImpl(repo: gh<_i50.SearchRepository>()));
    gh.factory<_i53.UserRepository>(() => _i54.UserRepositoryImpl(
          userService: gh<_i32.UserService>(),
          userLocal: gh<_i17.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i55.UserUseCase>(
        () => _i55.UserUseCaseImpl(repo: gh<_i53.UserRepository>()));
    gh.lazySingleton<_i56.AuthRepository>(() => _i57.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i34.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i11.NotificationService>(),
          userRepo: gh<_i53.UserRepository>(),
        ));
    gh.factory<_i58.AuthUseCase>(
        () => _i58.AuthUseCaeImpl(repo: gh<_i56.AuthRepository>()));
    gh.factory<_i59.AvatarCubit>(
        () => _i59.AvatarCubit(userUc: gh<_i55.UserUseCase>()));
    gh.factory<_i60.CreateGroupCubit>(
        () => _i60.CreateGroupCubit(groupUseCase: gh<_i45.GroupUseCase>()));
    gh.factory<_i61.EditProfileCubit>(
        () => _i61.EditProfileCubit(userUseCase: gh<_i55.UserUseCase>()));
    gh.factory<_i62.FindFriendBloc>(
        () => _i62.FindFriendBloc(userRepo: gh<_i53.UserRepository>()));
    gh.factory<_i63.FriendRequestActionCubit>(() =>
        _i63.FriendRequestActionCubit(friendUseCase: gh<_i40.FriendUseCase>()));
    gh.factory<_i64.FriendsContactBloc>(() => _i64.FriendsContactBloc(
          useCase: gh<_i40.FriendUseCase>(),
          userUseCase: gh<_i55.UserUseCase>(),
        ));
    gh.factory<_i65.GlobalSearch>(
        () => _i65.GlobalSearch(useCase: gh<_i52.SearchUseCase>()));
    gh.factory<_i66.GroupDetailBloc>(
        () => _i66.GroupDetailBloc(groupUC: gh<_i45.GroupUseCase>()));
    gh.factory<_i67.GroupListBloc>(
        () => _i67.GroupListBloc(useCase: gh<_i45.GroupUseCase>()));
    gh.factory<_i68.GroupRequestActionCubit>(() =>
        _i68.GroupRequestActionCubit(groupUseCase: gh<_i45.GroupUseCase>()));
    gh.factory<_i69.LoginCubit>(
        () => _i69.LoginCubit(authUseCase: gh<_i58.AuthUseCase>()));
    gh.factory<_i70.MHomeAppBar>(() => _i70.MHomeAppBar(
          key: gh<_i13.Key>(),
          title: gh<String>(),
          useCase: gh<_i52.SearchUseCase>(),
          bottomWidget: gh<_i13.PreferredSizeWidget>(),
          numberNotification: gh<int>(),
          actionButton: gh<_i13.Widget>(),
        ));
    gh.factory<_i71.ProfileFormCubit>(
        () => _i71.ProfileFormCubit(userUC: gh<_i55.UserUseCase>()));
    gh.factory<_i72.SendEmailCubit>(
        () => _i72.SendEmailCubit(authUseCase: gh<_i58.AuthUseCase>()));
    gh.factory<_i73.SettingCubit>(() => _i73.SettingCubit(
          authUseCase: gh<_i58.AuthUseCase>(),
          userUseCase: gh<_i55.UserUseCase>(),
          appSettingsUseCase: gh<_i20.AppSettingsUseCase>(),
        ));
    gh.factory<_i74.SignUpFormCubit>(
        () => _i74.SignUpFormCubit(authRepo: gh<_i56.AuthRepository>()));
    gh.factory<_i75.WelcomeCubit>(
        () => _i75.WelcomeCubit(authRepo: gh<_i56.AuthRepository>()));
    gh.lazySingleton<_i76.AppBloc>(
        () => _i76.AppBloc(authUC: gh<_i58.AuthUseCase>()));
    return this;
  }
}
