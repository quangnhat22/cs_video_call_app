part of welcome;

abstract class WelcomeState extends Equatable {}

class WelcomeInitial extends WelcomeState {
  @override
  List<Object?> get props => [];
}

class WelcomeSignInWithGoogleSuccess extends Equatable {
  const WelcomeSignInWithGoogleSuccess({
    this.status = LoginState.success,
  });

  final LoginState status;

  @override
  List<Object?> get props => [status];
}
