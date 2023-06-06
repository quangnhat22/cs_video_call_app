part of 'group_detail_bloc.dart';

@freezed
class GroupDetailState with _$GroupDetailState {
  const factory GroupDetailState.initial() = _Initial;
  const factory GroupDetailState.getDetailInProgress() =
      GroupGetDetailInProgress;
  const factory GroupDetailState.getDetailSuccess({
    required GroupDetailEntity groupDetail,
  }) = GroupGetDetailSuccess;
  const factory GroupDetailState.getDetailFail({
    String? message,
  }) = GroupGetDetailFail;
}
