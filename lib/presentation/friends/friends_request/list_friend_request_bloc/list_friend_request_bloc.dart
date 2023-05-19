import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/friend_request_entity.dart';
import '../../../../domain/modules/friend/friend_usecase.dart';

part 'list_friend_request_bloc.freezed.dart';
part 'list_friend_request_event.dart';
part 'list_friend_request_state.dart';

@Injectable()
class ListFriendRequestBloc
    extends Bloc<ListFriendRequestEvent, ListFriendRequestState> {
  ListFriendRequestBloc({required FriendUseCase friendUseCase})
      : _friendUC = friendUseCase,
        super(const _Initial()) {
    on<ListFriendRequestEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        listRequestRefreshed: (event) => _listRequestRefreshed(event, emit),
      );
    });
  }

  final FriendUseCase _friendUC;

  Future<void> _started(
      _Started event, Emitter<ListFriendRequestState> emit) async {
    try {
      emit(const GetListFriendRequestInProgress());
      final listSentRequest = await _friendUC.getSendRequest();
      final listReceivedRequest = await _friendUC.getReceiveRequest();
      //sort list
      listReceivedRequest.sortBy((receive) => receive.createdAt!);
      listSentRequest.sortBy((sent) => sent.createdAt!);
      emit(GetListFriendRequestSuccess(
          friendRequestSent: listSentRequest,
          friendRequestReceive: listReceivedRequest));
    } catch (e) {
      emit(GetListFriendRequestFail(message: e.toString()));
    }
  }

  Future<void> _listRequestRefreshed(ListSentFriendRequestRefreshed event,
      Emitter<ListFriendRequestState> emit) async {
    if (state is GetListFriendRequestSuccess) {
      add(const ListFriendRequestEvent.started());
    } else {
      return;
    }
  }
}
