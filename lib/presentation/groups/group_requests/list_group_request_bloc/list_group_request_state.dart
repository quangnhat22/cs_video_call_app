part of 'list_group_request_bloc.dart';

@freezed
class ListGroupRequestState with _$ListGroupRequestState {
  const factory ListGroupRequestState.initial() = _Initial;

  const factory ListGroupRequestState.getDataInProgress() =
      GetListGroupRequestInProgress;

  const factory ListGroupRequestState.getDataSuccess(
          {required List<GroupRequestEntity> groupRequestSent,
          required List<GroupRequestEntity> groupRequestReceived}) =
      GetListGroupRequestSuccess;

  const factory ListGroupRequestState.getDataFail({required String message}) =
      GetListGroupRequestFail;
}
