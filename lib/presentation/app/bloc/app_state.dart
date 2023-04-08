part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppLoading extends AppState {}

class AppAuthorized extends AppState {}

class AppUnAuthorized extends AppState {}
