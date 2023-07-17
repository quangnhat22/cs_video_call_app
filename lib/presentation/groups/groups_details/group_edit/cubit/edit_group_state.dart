part of 'edit_group_cubit.dart';

@freezed
class EditGroupState with _$EditGroupState {
  const factory EditGroupState.initial(
      {@Default('') String groupName,
      @Default('') String groupImage,
      @Default(false) bool isValid}) = SentEditRequestGroupInitValue;
  const factory EditGroupState.sendEditRequestSuccess(
      {required String groupName}) = SentEditRequestGroupSuccess;
  const factory EditGroupState.sendEditRequestInProgress() =
      SentEditRequestGroupInProgress;
  const factory EditGroupState.sentEditRequestFailure(
      {required String message}) = SentEditRequestGroupFailure;
}
