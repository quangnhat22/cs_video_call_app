import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_calling_page_view_state.dart';
part 'group_calling_page_view_cubit.freezed.dart';

class GroupCallingPageViewCubit extends Cubit<GroupCallingPageViewState> {
  GroupCallingPageViewCubit()
      : super(const GroupCallingPageViewState.initial());
}
