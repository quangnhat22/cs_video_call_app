import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'group_list_bloc.freezed.dart';
part 'group_list_event.dart';
part 'group_list_state.dart';

@Injectable()
class GroupListBloc extends Bloc<GroupListEvent, GroupListState> {
  GroupListBloc({
    required GroupUseCase useCase,
  })  : _useCase = useCase,
        super(const _Initial()) {
    on<GroupListEvent>((event, emit) async {
      await event.map(
        started: (event) async => await _started(event, emit),
        refreshed: (event) async => await _refreshed(event, emit),
      );
    });
  }

  final GroupUseCase _useCase;

  Future<void> _started(_Started event, Emitter<GroupListState> emit) async {
    try {
      emit(const GroupListLoading());

      final groups = await _useCase.getGroupList();
      emit(GroupListState.success(groups: groups));
    } catch (e) {
      emit(GroupListFailure(message: e.toString()));
    }
  }

  Future<void> _refreshed(
      GroupListRefreshed event, Emitter<GroupListState> emit) async {
    try {
      final groups = await _useCase.getGroupList();
      emit(GroupListState.success(groups: groups));
    } catch (e) {
      emit(GroupListFailure(message: e.toString()));
    }
  }
}
