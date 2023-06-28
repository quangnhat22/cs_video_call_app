import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_schedule_form_state.dart';
part 'create_schedule_form_cubit.freezed.dart';

@Injectable()
class CreateScheduleFormCubit extends Cubit<CreateScheduleFormState> {
  CreateScheduleFormCubit() : super(const CreateScheduleFormState.initial());

  void titleChanged(String? title) {
    if (title == null) return;
    emit(state.copyWith(meetingTitle: title.trim()));
  }

  void descriptionChanged(String? description) {
    if (description == null) return;
    emit(state.copyWith(description: description.trim()));
  }
}
