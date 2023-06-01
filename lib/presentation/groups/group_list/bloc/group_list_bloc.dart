import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'group_list_event.dart';
part 'group_list_state.dart';
part 'group_list_bloc.freezed.dart';

@Injectable()
class GroupListBloc extends Bloc<GroupListEvent, GroupListState> {
  GroupListBloc({
    required GroupUseCase useCase,
  })  : _useCase = useCase,
        super(const _Initial()) {
    on<GroupListEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
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
}
