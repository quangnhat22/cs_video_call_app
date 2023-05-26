import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/core/utils/formz/phone_number.dart';
import 'package:videocall/core/utils/formz/text_formz.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'profile_form_state.dart';
part 'profile_form_cubit.freezed.dart';

@Injectable()
class ProfileFormCubit extends Cubit<ProfileFormState> {
  ProfileFormCubit({required UserUseCase userUC})
      : _userUseCase = userUC,
        super(const ProfileFormState.initial());

  final UserUseCase _userUseCase;

  Future<void> initValue() async {
    final userInfo = await _userUseCase.getSelfFromLocal();
    emit(state.copyWith(
      fullName: TextFormz.dirty(userInfo?.name ?? ""),
      phoneNumber: PhoneNumber.dirty(userInfo?.phone ?? ""),
      dob: userInfo?.birthday,
      gender: AppGender.checkGenderEnum(userInfo?.gender),
      //bio: userInfo.bio,
    ));
  }

  void fullnameChanged(String? value) {
    final fullname = TextFormz.dirty(value ?? "");
    emit(
      state.copyWith(
        fullName: fullname,
        isValid: Formz.validate(
          [
            fullname,
            state.phoneNumber,
          ],
        ),
      ),
    );
  }

  void phoneNumberChanged(String? value) {
    final phoneNumber = PhoneNumber.dirty(value ?? "");
    emit(
      state.copyWith(
          phoneNumber: phoneNumber,
          isValid: Formz.validate([
            state.fullName,
            phoneNumber,
          ])),
    );
  }

  void birthdayChanged(DateTime value) {
    emit(state.copyWith(dob: value));
  }

  void genderChanged(AppGender value) {
    emit(state.copyWith(gender: value));
  }

  // void bioChanged(String? value) {
  //   emit(state.copyWith(bio: value));
  // }

  Future<void> updateUserInfo() async {
    try {
      emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
      if (!state.isValid || state.dob == null || state.gender == null) return;

      final isUpdateSuccess = await _userUseCase.updateSelf(
        name: state.fullName.value,
        phone: state.phoneNumber.value,
        birthday: state.dob?.toUtc(),
        gender: state.gender!.value,
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
