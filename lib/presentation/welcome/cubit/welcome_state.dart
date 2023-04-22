part of welcome;

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object?> get props => [];
}

class WelcomeInitial extends WelcomeState {}

class WelcomeSignInWithGoogleSuccess extends WelcomeState {}

class WelcomeSignInWithGoogleFailure extends WelcomeState {
  const WelcomeSignInWithGoogleFailure({
    this.message,
  });

  final String? message;

  @override
  List<Object?> get props => [message];
}