part of 'welcome_cubit.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.initial() = _Initial;
  const factory WelcomeState.signInWithGoogleInProgress() =
      SignInWithGoogleInProgress;
  const factory WelcomeState.signInWithGoogleSuccess() =
      SignInWithGoogleSuccess;
  const factory WelcomeState.signInFail(String? message) = SignInFail;
}
