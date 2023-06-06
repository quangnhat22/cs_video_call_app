part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial({
    @Default(TextFormz.pure()) TextFormz fullName,
    @Default(TextFormz.pure()) TextFormz address,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    DateTime? dob,
    @Default(AppGender.others) AppGender gender,
    @Default(TextFormz.pure()) TextFormz bio,
    @Default(false) bool isValid,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus submitStatus,
  }) = _Initial;
}
