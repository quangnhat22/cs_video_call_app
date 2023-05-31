part of 'create_group_cubit.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState.initial(
      {@Default('') String groupName,
      @Default('') String groupImage,
      @Default([]) List<UserEntity?> members,
      @Default(false) bool isValid}) = _Initial;
  const factory CreateGroupState.sendCreateRequestSuccess() =
      SentCreateRequestGroupSuccess;
  const factory CreateGroupState.sendCreateRequestInProgress() =
      SentCreateRequestGroupInProgress;
  const factory CreateGroupState.sentCreateRequestFailure(
      {required String message}) = SentCreateRequestGroupFailure;
}
