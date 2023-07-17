import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:videocall/core/routes/app_transition_animation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/presentation/auth/avatar/avatar.dart';
import 'package:videocall/presentation/auth/email_verify/email_verify.dart';
import 'package:videocall/presentation/auth/forgot_password/forgot_password.dart';
import 'package:videocall/presentation/auth/sign_up/sign_up.dart';
import 'package:videocall/presentation/call/friend_call/friend_call.dart';
import 'package:videocall/presentation/call/group_call/pages/group_call_main_page.dart';
import 'package:videocall/presentation/dash_board/dash_board.dart';
import 'package:videocall/presentation/friends/find_new_friend/find_new_friend.dart';
import 'package:videocall/presentation/friends/friends_dash_board/friends_dash_board.dart';
import 'package:videocall/presentation/friends/friends_infor/friends_infor.dart';
import 'package:videocall/presentation/groups/create_group/create_group.dart';
import 'package:videocall/presentation/groups/group_list/widgets/group_list_item.dart';
import 'package:videocall/presentation/groups/groups_dash_board/groups_dash_board.dart';
import 'package:videocall/presentation/groups/groups_details/group_detail_dash_board/pages/groups_details_page.dart';
import 'package:videocall/presentation/groups/groups_details/group_edit/group_edit.dart';
import 'package:videocall/presentation/notifications/loading/loading_page.dart';
import 'package:videocall/presentation/notifications/notification_setting/notification_setting.dart';
import 'package:videocall/presentation/notifications/notifications_dash_board/notifications_dash_board.dart';
import 'package:videocall/presentation/schedules/create_meeting/pages/create_meeting_page.dart';
import 'package:videocall/presentation/schedules/schedules_dash_board/schedule_dash_board.dart';
import 'package:videocall/presentation/setting/about_us/about_us.dart';
import 'package:videocall/presentation/setting/change_password/change_password.dart';
import 'package:videocall/presentation/setting/devices/devices.dart';
import 'package:videocall/presentation/setting/edit_profile/edit_profile.dart';
import 'package:videocall/presentation/welcome/welcome.dart';

import '../../domain/entities/user_entity.dart';
import '../../presentation/auth/login/login.dart';
import '../../presentation/setting/setting_dash_board/setting_dash_board.dart';

class AppRoutes {
  static final routeObserver = RouteObserver<PageRoute>();

  static Route loadingRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _buildRoute(
          settings,
          const LoadingPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomePage:
        return _buildRoute(settings, const WelcomePage());
      case RouteName.loginPage:
        return _buildAnimationRoute(settings, const LoginPage());
      case RouteName.forgotPasswordPage:
        return _buildAnimationRoute(settings, const ResetPasswordPage());
      case RouteName.signUpPage:
        return _buildAnimationRoute(settings, const SignUpPage());
      default:
        return _errorRoute();
    }
  }

  static Route authorizedRoute(RouteSettings settings) {
    log(settings.name.toString());
    switch (settings.name) {
      case RouteName.dashboard:
        return _buildAnimationRoute(settings, const DashboardPage());
      case RouteName.friends:
        return _buildAnimationRoute(settings, const FriendsDashBoardPage());
      case RouteName.findFriend:
        return _buildAnimationRoute(settings, const FindNewFriendPage());
      case RouteName.friendInfo:
        return _buildAnimationRoute(settings,
            FriendsInfoPage(userInfo: settings.arguments as UserEntity));
      case RouteName.groups:
        return _buildAnimationRoute(settings, const GroupsDashBoardPage());
      case RouteName.teamDetails:
        return _buildAnimationRoute(
            settings,
            GroupDetailPage(
              groupArgs: settings.arguments as GroupArguments,
            ));
      case RouteName.schedules:
        return _buildRoute(settings, ScheduleDashBoardPage());
      case RouteName.notifications:
        return _buildRoute(settings, const NotificationsDashBoardPage());
      case RouteName.settings:
        return _buildRoute(settings, const SettingDashBoardPage());
      case RouteName.emailVerify:
        return _buildAnimationRoute(
            settings, VerifyEmailPage(email: settings.arguments as String?));
      case RouteName.updateAvatar:
        return _buildAnimationRoute(settings, const AvatarPage());
      case RouteName.editProfile:
        return _buildAnimationRoute(settings, const EditProfilePage());
      case RouteName.createGroup:
        return _buildRoute(settings, const CreateGroupPage());
      case RouteName.editGroup:
        {
          final argument = settings.arguments as Map<String, dynamic>;
          final groupId = argument["groupId"] as String;
          final groupName = argument["groupName"] as String;
          final groupImage = argument["groupImage"] as String;
          return _buildAnimationRoute(
              settings,
              EditGroupPage(
                groupId: groupId,
                groupName: groupName,
                groupImage: groupImage,
              ));
        }
      case RouteName.createSchedule:
        return _buildAnimationRoute(
            settings,
            CreateMeetingPage(
              groupId: settings.arguments as String,
            ));
      case RouteName.personalCall:
        {
          final argument = settings.arguments as Map<String, dynamic>;

          final friendId = argument["friendId"] as String;
          final chatRoomId = argument["chatRoomId"] as String?;

          return _buildAnimationRoute(
            settings,
            FriendCallPage(friendId: friendId, chatRoomId: chatRoomId),
          );
        }
      case RouteName.createGroupCall:
        final arguments = settings.arguments as Map<String, dynamic>;
        final token = arguments['token'] as String;
        final groupId = arguments["groupId"] as String;

        return _buildAnimationRoute(
            settings,
            GroupCallPage(
              token: token,
              groupId: groupId,
            ));
      case RouteName.devices:
        return _buildAnimationRoute(settings, const DevicesPage());
      case RouteName.changePassword:
        return _buildAnimationRoute(settings, const ChangePasswordPage());
      case RouteName.aboutUs:
        return _buildAnimationRoute(settings, const AboutUsPage());
      case RouteName.notificationSetting:
        return _buildAnimationRoute(settings, const NotificationSettingPage());
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static SlideRightRoute _buildAnimationRoute(
      RouteSettings settings, Widget builder) {
    return SlideRightRoute(
      page: builder,
    );
  }

  // static MaterialPageRoute _buildRouteDialog(
  //     RouteSettings settings, Widget builder) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     fullscreenDialog: true,
  //     builder: (BuildContext context) => builder,
  //   );
  // }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Coming soon'),
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }
}
