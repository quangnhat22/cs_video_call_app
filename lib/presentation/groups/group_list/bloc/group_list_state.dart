part of 'group_list_bloc.dart';

@freezed
class GroupListState with _$GroupListState {
  const factory GroupListState.initial() = _Initial;
  const factory GroupListState.loading() = GroupListLoading;
  const factory GroupListState.success({required List<GroupEntity> groups}) =
      GroupListSuccess;
  const factory GroupListState.failure({
    required String message,
  }) = GroupListFailure;
}
