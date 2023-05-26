part of 'profile_form_cubit.dart';

@freezed
class ProfileFormState with _$ProfileFormState {
  const factory ProfileFormState.initial({
    @Default(TextFormz.pure()) TextFormz fullName,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    DateTime? dob,
    @Default(AppGender.others) AppGender? gender,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus submitStatus,
    @Default(false) bool isValid,
  }) = _Initial;
}
