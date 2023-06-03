part of 'group_request_action_cubit.dart';

@freezed
class GroupRequestActionState with _$GroupRequestActionState {
  const factory GroupRequestActionState.initial() = _Initial;
  const factory GroupRequestActionState.loading() = GroupActionLoading;
  const factory GroupRequestActionState.success() = GroupActionSuccess;
  const factory GroupRequestActionState.failure({required String message}) =
      GroupActionFailure;
}
