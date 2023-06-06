part of 'group_detail_bloc.dart';

@freezed
class GroupDetailEvent with _$GroupDetailEvent {
  const factory GroupDetailEvent.started({required String groupId}) = _Started;
}
