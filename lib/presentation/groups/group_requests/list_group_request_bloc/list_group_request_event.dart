part of 'list_group_request_bloc.dart';

@freezed
class ListGroupRequestEvent with _$ListGroupRequestEvent {
  const factory ListGroupRequestEvent.started() = _Started;

  const factory ListGroupRequestEvent.listRequestRefreshed() =
      ListGroupRequestRefreshed;

  const factory ListGroupRequestEvent.listSentRequestRefreshed() =
      ListSentGroupRequestRefreshed;

  const factory ListGroupRequestEvent.listReceiveRequestRefreshed() =
      ListReceiveGroupRequestRefreshed;
}
