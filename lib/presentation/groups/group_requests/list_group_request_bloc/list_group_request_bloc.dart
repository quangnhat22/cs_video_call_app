import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/group_request_entity.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'list_group_request_bloc.freezed.dart';
part 'list_group_request_event.dart';
part 'list_group_request_state.dart';

@Injectable()
class ListGroupRequestBloc
    extends Bloc<ListGroupRequestEvent, ListGroupRequestState> {
  ListGroupRequestBloc({required GroupUseCase groupUseCase})
      : _groupUseCase = groupUseCase,
        super(const _Initial()) {
    on<ListGroupRequestEvent>((event, emit) async {
      await event.map(
        started: (event) async => await _started(event, emit),
        listRequestRefreshed: (event) async =>
            await _listRequestRefreshed(event, emit),
        listSentRequestRefreshed: (event) async =>
            await _listSentRequestRefreshed(event, emit),
        listReceiveRequestRefreshed: (event) async =>
            await _listReceiveRequestRefreshed(event, emit),
      );
    });
  }

  final GroupUseCase _groupUseCase;

  Future<void> _started(
      _Started event, Emitter<ListGroupRequestState> emit) async {
    try {
      emit(const GetListGroupRequestInProgress());

      final sentRequestList = await _groupUseCase.getSentRequest();
      final receivedRequestList = await _groupUseCase.getReceivedRequest();

      sentRequestList.sortBy((request) => request.createdAt!);
      receivedRequestList.sortBy((request) => request.createdAt!);

      emit(GetListGroupRequestSuccess(
          groupRequestSent: sentRequestList,
          groupRequestReceived: receivedRequestList));
    } catch (e) {
      emit(GetListGroupRequestFail(message: e.toString()));
    }
  }

  Future<void> _listRequestRefreshed(ListGroupRequestRefreshed event,
      Emitter<ListGroupRequestState> emit) async {
    try {
      if (state is GetListGroupRequestSuccess) {
        final currentState = (state as GetListGroupRequestSuccess);
        final sentRequestList = await _groupUseCase.getSentRequest();
        final receivedRequestList = await _groupUseCase.getReceivedRequest();
        sentRequestList.sortBy((request) => request.createdAt!);
        receivedRequestList.sortBy((request) => request.createdAt!);
        emit(currentState.copyWith(
            groupRequestSent: sentRequestList,
            groupRequestReceived: receivedRequestList));
      }
    } catch (e) {
      emit(GetListGroupRequestFail(message: e.toString()));
    }
  }

  Future<void> _listSentRequestRefreshed(ListSentGroupRequestRefreshed event,
      Emitter<ListGroupRequestState> emit) async {
    try {
      if (state is GetListGroupRequestSuccess) {
        final currentState = (state as GetListGroupRequestSuccess);
        final sentRequestList = await _groupUseCase.getSentRequest();

        sentRequestList.sortBy((request) => request.createdAt!);

        emit(currentState.copyWith(groupRequestSent: sentRequestList));
      }
    } catch (e) {
      emit(GetListGroupRequestFail(message: e.toString()));
    }
  }

  Future<void> _listReceiveRequestRefreshed(
      event, Emitter<ListGroupRequestState> emit) async {
    try {
      if (state is GetListGroupRequestSuccess) {
        final currentState = (state as GetListGroupRequestSuccess);

        final receivedRequestList = await _groupUseCase.getReceivedRequest();

        receivedRequestList.sortBy((request) => request.createdAt!);
        emit(currentState.copyWith(groupRequestReceived: receivedRequestList));
      }
    } catch (e) {
      emit(GetListGroupRequestFail(message: e.toString()));
    }
  }
}
