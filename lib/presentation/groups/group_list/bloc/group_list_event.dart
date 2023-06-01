part of 'group_list_bloc.dart';

@freezed
class GroupListEvent with _$GroupListEvent {
  const factory GroupListEvent.started() = _Started;
}