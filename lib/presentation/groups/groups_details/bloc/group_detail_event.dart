part of 'group_detail_bloc.dart';

@freezed
class GroupDetailEvent with _$GroupDetailEvent {
  const factory GroupDetailEvent.started({required String groupId}) = _Started;

  const factory GroupDetailEvent.refreshed() = GroupDetailRefresh;

  const factory GroupDetailEvent.leaveGroup({required String groupId}) =
      GroupDetailLeave;
}
