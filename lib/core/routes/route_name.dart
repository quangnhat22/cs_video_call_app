class RouteName {
  RouteName._();

  // unauth
  static const String welcomePage = '/';
  static const String loginPage = '/login';
  static const String signUpPage = '/sign-up';
  static const String forgotPasswordPage = '/forgot-password';

  // auth
  static const String dashboard = '/';
  static const String friends = '/friends';
  static const String findFriend = '/find-friend';
  static const String friendInfo = '/friends-info';
  static const String groups = '/groups';
  static const String schedules = '/schedules';
  static const String notifications = '/notifications';
  static const String settings = '/setting';
  static const String editProfile = '/edit-profile';
  static const String emailVerify = '/email-verify';
  static const String updateAvatar = '/update-avatar';
  static const String teamDetails = '/team-details';
  static const String teamCallDetails = '/team-call-details';
  static const String createGroup = '/create-group';
  static const String callPending = '/call-pending';
  static const String createSchedule = '/create-schedule';

  //error
  static const String notFoundPage = '/not-found';
}
