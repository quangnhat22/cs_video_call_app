import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/group_detail_entity.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'group_detail_event.dart';
part 'group_detail_state.dart';
part 'group_detail_bloc.freezed.dart';

@Injectable()
class GroupDetailBloc extends Bloc<GroupDetailEvent, GroupDetailState> {
  GroupDetailBloc({required GroupUseCase groupUC})
      : _groupUC = groupUC,
        super(const _Initial()) {
    on<GroupDetailEvent>((event, emit) async {
      await event.map(
        started: (event) async => await _started(event, emit),
      );
    });
  }

  final GroupUseCase _groupUC;

  Future<void> _started(_Started event, Emitter<GroupDetailState> emit) async {
    try {
      final groupDetailInfor = await _groupUC.getGroupDetail(event.groupId);
      if (groupDetailInfor != null) {
        emit(GroupGetDetailSuccess(groupDetail: groupDetailInfor));
      } else {
        emit(
          const GroupDetailState.getDetailFail(
              message: "Something wrong! Try again"),
        );
      }
    } catch (e) {
      emit(GroupGetDetailFail(message: e.toString()));
    }
  }
}
