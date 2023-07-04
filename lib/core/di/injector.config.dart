// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:awesome_notifications/awesome_notifications.dart' as _i19;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter_bloc/flutter_bloc.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:videocall/common/widgets/stateless/app_bar/m_app_bar.dart'
    as _i14;
import 'package:videocall/core/services/notification_controller.dart' as _i16;
import 'package:videocall/core/services/notification_service.dart' as _i17;
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart'
    as _i3;
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart' as _i4;
import 'package:videocall/data/data_sources/firebase/personal_call_room_firebase.dart'
    as _i20;
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart'
    as _i5;
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart'
    as _i21;
import 'package:videocall/data/data_sources/local/user_local_data_src.dart'
    as _i22;
import 'package:videocall/data/data_sources/remote/base_servie.dart' as _i26;
import 'package:videocall/data/data_sources/remote/dio_interceptor.dart' as _i8;
import 'package:videocall/data/data_sources/remote/service/auth_service.dart'
    as _i41;
import 'package:videocall/data/data_sources/remote/service/call_group_service.dart'
    as _i27;
import 'package:videocall/data/data_sources/remote/service/call_serivce.dart'
    as _i28;
import 'package:videocall/data/data_sources/remote/service/device_service.dart'
    as _i29;
import 'package:videocall/data/data_sources/remote/service/friend_service.dart'
    as _i32;
import 'package:videocall/data/data_sources/remote/service/group_service.dart'
    as _i33;
import 'package:videocall/data/data_sources/remote/service/message_service.dart'
    as _i37;
import 'package:videocall/data/data_sources/remote/service/search_service.dart'
    as _i38;
import 'package:videocall/data/data_sources/remote/service/user_service.dart'
    as _i39;
import 'package:videocall/data/repositories/app_settings_repository_impl.dart'
    as _i24;
import 'package:videocall/data/repositories/auth_repository_impl.dart' as _i74;
import 'package:videocall/data/repositories/call_group_repository_impl.dart'
    as _i35;
import 'package:videocall/data/repositories/device_repository_impl.dart'
    as _i47;
import 'package:videocall/data/repositories/friend_repository_impl.dart'
    as _i51;
import 'package:videocall/data/repositories/group_repository_impl.dart' as _i57;
import 'package:videocall/data/repositories/message_repository_impl.dart'
    as _i62;
import 'package:videocall/data/repositories/search_repository_impl.dart'
    as _i68;
import 'package:videocall/data/repositories/user_repository_impl.dart' as _i71;
import 'package:videocall/data/repositories/webrtc_repository_impl.dart'
    as _i43;
import 'package:videocall/domain/modules/app_settings/app_settings_repository.dart'
    as _i23;
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart'
    as _i25;
import 'package:videocall/domain/modules/auth/auth_repostiory.dart' as _i73;
import 'package:videocall/domain/modules/auth/auth_usecase.dart' as _i75;
import 'package:videocall/domain/modules/call/call_repository.dart' as _i42;
import 'package:videocall/domain/modules/call/call_usecase.dart' as _i44;
import 'package:videocall/domain/modules/call/livekit_call_repository.dart'
    as _i34;
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart'
    as _i36;
import 'package:videocall/domain/modules/device/device_repository.dart' as _i46;
import 'package:videocall/domain/modules/device/device_usecase.dart' as _i48;
import 'package:videocall/domain/modules/friend/friend_repository.dart' as _i50;
import 'package:videocall/domain/modules/friend/friend_usecase.dart' as _i52;
import 'package:videocall/domain/modules/group/group_repository.dart' as _i56;
import 'package:videocall/domain/modules/group/group_usecase.dart' as _i58;
import 'package:videocall/domain/modules/message/message_repository.dart'
    as _i61;
import 'package:videocall/domain/modules/message/message_usecase.dart' as _i63;
import 'package:videocall/domain/modules/search/search_repository.dart' as _i67;
import 'package:videocall/domain/modules/search/search_usecase.dart' as _i69;
import 'package:videocall/domain/modules/user/user_repository.dart' as _i70;
import 'package:videocall/domain/modules/user/user_usecase.dart' as _i72;
import 'package:videocall/presentation/app/app_setting_cubit/app_setting_cubit.dart'
    as _i40;
import 'package:videocall/presentation/app/bloc/app_bloc.dart' as _i93;
import 'package:videocall/presentation/auth/avatar/cubit_avatar/avatar_cubit.dart'
    as _i76;
import 'package:videocall/presentation/auth/email_verify/cubit_send_email/send_email_cubit.dart'
    as _i88;
import 'package:videocall/presentation/auth/forgot_password/cubit/send_email_cubit.dart'
    as _i89;
import 'package:videocall/presentation/auth/login/cubit/login_cubit.dart'
    as _i86;
import 'package:videocall/presentation/auth/profile/cubit_profile_form/profile_form_cubit.dart'
    as _i87;
import 'package:videocall/presentation/auth/sign_up/cubit_sign_up/sign_up_form_cubit.dart'
    as _i91;
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart'
    as _i6;
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart'
    as _i66;
import 'package:videocall/presentation/call/personal_call/page/personal_call_page.dart'
    as _i18;
import 'package:videocall/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i80;
import 'package:videocall/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i9;
import 'package:videocall/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i82;
import 'package:videocall/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i53;
import 'package:videocall/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i10;
import 'package:videocall/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i81;
import 'package:videocall/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i59;
import 'package:videocall/presentation/global_search/bloc/global_search_bloc.dart'
    as _i13;
import 'package:videocall/presentation/global_search/global_search.dart'
    as _i11;
import 'package:videocall/presentation/groups/create_group/cubit/create_group_cubit.dart'
    as _i78;
import 'package:videocall/presentation/groups/group_list/bloc/group_list_bloc.dart'
    as _i84;
import 'package:videocall/presentation/groups/group_requests/group_request_action_cubit/group_request_action_cubit.dart'
    as _i85;
import 'package:videocall/presentation/groups/group_requests/list_group_request_bloc/list_group_request_bloc.dart'
    as _i60;
import 'package:videocall/presentation/groups/groups_details/bloc/group_detail_bloc.dart'
    as _i83;
import 'package:videocall/presentation/groups/groups_details/cubit_group_meeting/group_meeting_cubit.dart'
    as _i55;
import 'package:videocall/presentation/groups/groups_details/cubit_inivite_new_member/new_member_cubit.dart'
    as _i65;
import 'package:videocall/presentation/groups/groups_details/group_meeting/bloc/group_list_meeting_bloc.dart'
    as _i54;
import 'package:videocall/presentation/groups/groups_details/group_messages/bloc/messages_bloc.dart'
    as _i64;
import 'package:videocall/presentation/schedules/create_meeting/bloc/create_meeting_bloc.dart'
    as _i45;
import 'package:videocall/presentation/schedules/create_meeting/cubit/create_schedule_form_cubit.dart'
    as _i7;
import 'package:videocall/presentation/setting/change_password/cubit/change_password_cubit.dart'
    as _i77;
import 'package:videocall/presentation/setting/devices/bloc/devices_bloc.dart'
    as _i49;
import 'package:videocall/presentation/setting/edit_language/cubit/edit_language_cubit.dart'
    as _i30;
import 'package:videocall/presentation/setting/edit_profile/cubit/edit_profile_cubit.dart'
    as _i79;
import 'package:videocall/presentation/setting/edit_theme/cubit/edit_theme_cubit.dart'
    as _i31;
import 'package:videocall/presentation/setting/setting_dash_board/cubit/setting_cubit.dart'
    as _i90;
import 'package:videocall/presentation/welcome/cubit/welcome_cubit.dart'
    as _i92;

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
    gh.factory<_i7.CreateScheduleFormCubit>(
        () => _i7.CreateScheduleFormCubit());
    gh.singleton<_i8.DioInterceptor>(
        _i8.DioInterceptor(gh<_i5.AuthLocalDataSrc>()));
    gh.factory<_i9.FindFriendFormCubit>(() => _i9.FindFriendFormCubit());
    gh.factory<_i10.FriendInfoCubit>(() => _i10.FriendInfoCubit());
    gh.factory<_i11.GlobalSearch>(() => _i11.GlobalSearch(
        gh<_i12.Bloc<_i13.GlobalSearchEvent, _i13.GlobalSearchState>>()));
    gh.factory<_i14.MHomeAppBar>(() => _i14.MHomeAppBar(
          key: gh<_i15.Key>(),
          title: gh<String>(),
          bottomWidget: gh<_i15.PreferredSizeWidget>(),
          numberNotification: gh<int>(),
          actionButton: gh<_i15.Widget>(),
        ));
    gh.factory<_i16.NotificationController>(
        () => _i16.NotificationController());
    gh.lazySingleton<_i17.NotificationService>(
        () => _i17.NotificationService());
    gh.factory<_i18.PersonalCallPage>(() => _i18.PersonalCallPage(
          key: gh<_i15.Key>(),
          receivedAction: gh<_i19.ReceivedAction>(),
          friendId: gh<String>(),
        ));
    gh.factory<_i20.PersonalCallRoomFirebase>(
        () => _i20.PersonalCallRoomFirebase());
    gh.lazySingleton<_i21.SettingLocalDataSrc>(
        () => _i21.SettingLocalDataSrc());
    gh.lazySingleton<_i22.UserLocalDataSrc>(() => _i22.UserLocalDataSrc());
    gh.factory<_i23.AppSettingsRepository>(() => _i24.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i21.SettingLocalDataSrc>()));
    gh.factory<_i25.AppSettingsUseCase>(() => _i25.AppSettingsUseCaseImpl(
        appSettingsRepo: gh<_i23.AppSettingsRepository>()));
    gh.singleton<_i26.BaseService>(
        _i26.BaseService(interceptor: gh<_i8.DioInterceptor>()));
    gh.factory<_i27.CallGroupService>(
        () => _i27.CallGroupService(service: gh<_i26.BaseService>()));
    gh.factory<_i28.CallService>(
        () => _i28.CallService(service: gh<_i26.BaseService>()));
    gh.factory<_i29.DeviceService>(
        () => _i29.DeviceService(service: gh<_i26.BaseService>()));
    gh.factory<_i30.EditLanguageCubit>(
        () => _i30.EditLanguageCubit(usecase: gh<_i25.AppSettingsUseCase>()));
    gh.factory<_i31.EditThemeCubit>(
        () => _i31.EditThemeCubit(usecase: gh<_i25.AppSettingsUseCase>()));
    gh.factory<_i32.FriendService>(
        () => _i32.FriendService(service: gh<_i26.BaseService>()));
    gh.factory<_i33.GroupService>(
        () => _i33.GroupService(service: gh<_i26.BaseService>()));
    gh.factory<_i34.LiveKitCallRepository>(() => _i35.CallGroupRepositoryImpl(
        callGroupService: gh<_i27.CallGroupService>()));
    gh.factory<_i36.LiveKitCallUseCase>(() => _i36.LiveKitCallUseCaseImpl(
        callGroupRepo: gh<_i34.LiveKitCallRepository>()));
    gh.factory<_i37.MessageService>(
        () => _i37.MessageService(service: gh<_i26.BaseService>()));
    gh.factory<_i38.SearchService>(
        () => _i38.SearchService(service: gh<_i26.BaseService>()));
    gh.lazySingleton<_i39.UserService>(
        () => _i39.UserService(service: gh<_i26.BaseService>()));
    gh.factory<_i40.AppSettingCubit>(
        () => _i40.AppSettingCubit(useCase: gh<_i25.AppSettingsUseCase>()));
    gh.factory<_i41.AuthService>(
        () => _i41.AuthService(service: gh<_i26.BaseService>()));
    gh.factory<_i42.CallRepository>(() => _i43.WebRTCRepositoryImpl(
          callRoomFirebase: gh<_i20.PersonalCallRoomFirebase>(),
          callService: gh<_i28.CallService>(),
        ));
    gh.factory<_i44.CallUseCase>(
        () => _i44.CallUseCaseImpl(callRepo: gh<_i42.CallRepository>()));
    gh.factory<_i45.CreateMeetingBloc>(
        () => _i45.CreateMeetingBloc(gh<_i36.LiveKitCallUseCase>()));
    gh.factory<_i46.DeviceRepository>(() => _i47.DeviceRepositoryImpl(
          deviceService: gh<_i29.DeviceService>(),
          notificationService: gh<_i17.NotificationService>(),
        ));
    gh.factory<_i48.DeviceUseCase>(() =>
        _i48.DeviceUseCaseImpl(deviceRepository: gh<_i46.DeviceRepository>()));
    gh.factory<_i49.DevicesBloc>(
        () => _i49.DevicesBloc(deviceUseCase: gh<_i48.DeviceUseCase>()));
    gh.factory<_i50.FriendRepository>(
        () => _i51.FriendRepositoryImpl(service: gh<_i32.FriendService>()));
    gh.factory<_i52.FriendUseCase>(
        () => _i52.FriendUseCaseImpl(friendRepo: gh<_i50.FriendRepository>()));
    gh.factory<_i53.FriendsActionCubit>(
        () => _i53.FriendsActionCubit(friendUC: gh<_i52.FriendUseCase>()));
    gh.factory<_i54.GroupListMeetingBloc>(() => _i54.GroupListMeetingBloc(
        liveKitCallUseCase: gh<_i36.LiveKitCallUseCase>()));
    gh.factory<_i55.GroupMeetingCubit>(() =>
        _i55.GroupMeetingCubit(liveKitCallUC: gh<_i36.LiveKitCallUseCase>()));
    gh.factory<_i56.GroupRepository>(() => _i57.GroupRepositoryImpl(
          service: gh<_i33.GroupService>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i58.GroupUseCase>(
        () => _i58.GroupUseCaseImpl(groupRepo: gh<_i56.GroupRepository>()));
    gh.factory<_i59.ListFriendRequestBloc>(() =>
        _i59.ListFriendRequestBloc(friendUseCase: gh<_i52.FriendUseCase>()));
    gh.factory<_i60.ListGroupRequestBloc>(
        () => _i60.ListGroupRequestBloc(groupUseCase: gh<_i58.GroupUseCase>()));
    gh.factory<_i61.MessageRepository>(() =>
        _i62.MessageRepositoryImpl(messageService: gh<_i37.MessageService>()));
    gh.factory<_i63.MessageUseCase>(() => _i63.MessageUseCaseImpl(
        messageRepository: gh<_i61.MessageRepository>()));
    gh.factory<_i64.MessagesBloc>(
        () => _i64.MessagesBloc(messageUseCase: gh<_i63.MessageUseCase>()));
    gh.factory<_i65.NewMemberCubit>(() => _i65.NewMemberCubit(
          friendUC: gh<_i52.FriendUseCase>(),
          groupUC: gh<_i58.GroupUseCase>(),
        ));
    gh.factory<_i66.PersonalCallCubit>(
        () => _i66.PersonalCallCubit(callUC: gh<_i44.CallUseCase>()));
    gh.factory<_i67.SearchRepository>(
        () => _i68.SearchRepositoryImpl(service: gh<_i38.SearchService>()));
    gh.factory<_i69.SearchUseCase>(
        () => _i69.SearchUseCaseImpl(repo: gh<_i67.SearchRepository>()));
    gh.factory<_i70.UserRepository>(() => _i71.UserRepositoryImpl(
          userService: gh<_i39.UserService>(),
          userLocal: gh<_i22.UserLocalDataSrc>(),
          assetFirebase: gh<_i3.AssetFirebase>(),
        ));
    gh.factory<_i72.UserUseCase>(
        () => _i72.UserUseCaseImpl(repo: gh<_i70.UserRepository>()));
    gh.lazySingleton<_i73.AuthRepository>(() => _i74.AuthRepositoryImpl(
          authFirebase: gh<_i4.AuthFirebase>(),
          authService: gh<_i41.AuthService>(),
          authLocalDataSrc: gh<_i5.AuthLocalDataSrc>(),
          notificationService: gh<_i17.NotificationService>(),
          userRepo: gh<_i70.UserRepository>(),
        ));
    gh.factory<_i75.AuthUseCase>(
        () => _i75.AuthUseCaeImpl(repo: gh<_i73.AuthRepository>()));
    gh.factory<_i76.AvatarCubit>(
        () => _i76.AvatarCubit(userUc: gh<_i72.UserUseCase>()));
    gh.factory<_i77.ChangePasswordCubit>(
        () => _i77.ChangePasswordCubit(authUseCase: gh<_i75.AuthUseCase>()));
    gh.factory<_i78.CreateGroupCubit>(
        () => _i78.CreateGroupCubit(groupUseCase: gh<_i58.GroupUseCase>()));
    gh.factory<_i79.EditProfileCubit>(
        () => _i79.EditProfileCubit(userUseCase: gh<_i72.UserUseCase>()));
    gh.factory<_i80.FindFriendBloc>(
        () => _i80.FindFriendBloc(userRepo: gh<_i70.UserRepository>()));
    gh.factory<_i81.FriendRequestActionCubit>(() =>
        _i81.FriendRequestActionCubit(friendUseCase: gh<_i52.FriendUseCase>()));
    gh.factory<_i82.FriendsContactBloc>(() => _i82.FriendsContactBloc(
          useCase: gh<_i52.FriendUseCase>(),
          userUseCase: gh<_i72.UserUseCase>(),
        ));
    gh.factory<_i13.GlobalSearchBloc>(
        () => _i13.GlobalSearchBloc(searchUseCase: gh<_i69.SearchUseCase>()));
    gh.factory<_i83.GroupDetailBloc>(
        () => _i83.GroupDetailBloc(groupUC: gh<_i58.GroupUseCase>()));
    gh.factory<_i84.GroupListBloc>(
        () => _i84.GroupListBloc(useCase: gh<_i58.GroupUseCase>()));
    gh.factory<_i85.GroupRequestActionCubit>(() =>
        _i85.GroupRequestActionCubit(groupUseCase: gh<_i58.GroupUseCase>()));
    gh.factory<_i86.LoginCubit>(
        () => _i86.LoginCubit(authUseCase: gh<_i75.AuthUseCase>()));
    gh.factory<_i87.ProfileFormCubit>(
        () => _i87.ProfileFormCubit(userUC: gh<_i72.UserUseCase>()));
    gh.factory<_i88.SendEmailCubit>(
        () => _i88.SendEmailCubit(authUseCase: gh<_i75.AuthUseCase>()));
    gh.factory<_i89.SendEmailCubit>(
        () => _i89.SendEmailCubit(authUseCase: gh<_i75.AuthUseCase>()));
    gh.factory<_i90.SettingCubit>(() => _i90.SettingCubit(
          authUseCase: gh<_i75.AuthUseCase>(),
          userUseCase: gh<_i72.UserUseCase>(),
          appSettingsUseCase: gh<_i25.AppSettingsUseCase>(),
        ));
    gh.factory<_i91.SignUpFormCubit>(
        () => _i91.SignUpFormCubit(authRepo: gh<_i73.AuthRepository>()));
    gh.factory<_i92.WelcomeCubit>(
        () => _i92.WelcomeCubit(authRepo: gh<_i73.AuthRepository>()));
    gh.lazySingleton<_i93.AppBloc>(
        () => _i93.AppBloc(authUC: gh<_i75.AuthUseCase>()));
    return this;
  }
}
