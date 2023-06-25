import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/utils/formz/phone_number.dart';
import 'package:videocall/core/utils/formz/text_formz.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required UserUseCase userUseCase})
      : _userUseCase = userUseCase,
        super(const EditProfileState.initial());

  final UserUseCase _userUseCase;

  Future<void> initValue() async {
    final userInfo = await _userUseCase.getSelfFromLocal();
    emit(state.copyWith(
      fullName: TextFormz.dirty(userInfo?.name ?? ""),
      phoneNumber: PhoneNumber.dirty(userInfo?.phone ?? ""),
      dob: userInfo?.birthday ?? DateTime.now(),
      gender: AppGender.checkGenderEnum(userInfo?.gender),
      bio: TextFormz.dirty(userInfo?.bio ?? ""),
    ));
  }

  void fullNameChanged(String value) {
    final fullName = TextFormz.dirty(value);

    emit(state.copyWith(
        fullName: fullName,
        isValid: Formz.validate([
          fullName,
          state.phoneNumber,
        ])));
  }

  void phoneNumberChanged(String? value) {
    final phoneNumber = PhoneNumber.dirty(value!);

    emit(
      state.copyWith(
          phoneNumber: phoneNumber,
          isValid: Formz.validate([
            phoneNumber,
            state.fullName,
          ])),
    );
  }

  void birthdayChanged(DateTime value) {
    emit(state.copyWith(
        dob: value,
        isValid: Formz.validate([
          state.phoneNumber,
          state.fullName,
        ])));
  }

  void genderChanged(AppGender value) {
    emit(state.copyWith(
        gender: value,
        isValid: Formz.validate([
          state.phoneNumber,
          state.fullName,
        ])));
  }

  void bioChanged(String value) {
    final bio = TextFormz.dirty(value);
    emit(state.copyWith(
      bio: bio,
    ));
  }

  Future<void> updateUserInfo() async {
    try {
      emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
      if (!state.isValid || state.dob == null) return;

      final isUpdateSuccess = await _userUseCase.updateSelf(
        name: state.fullName.value,
        phone: state.phoneNumber.value,
        birthday: state.dob?.toUtc(),
        gender: state.gender.value,
        bio: state.bio.value,
      );

      if (isUpdateSuccess) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      throw Exception(e.toString());
    }
  }
}
