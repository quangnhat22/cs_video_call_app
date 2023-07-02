part of 'create_schedule_form_cubit.dart';

@freezed
class CreateScheduleFormState with _$CreateScheduleFormState {
  const factory CreateScheduleFormState.initial({
    String? meetingTitle,
    String? selectGroupId,
    String? description,
  }) = _Initial;
}
