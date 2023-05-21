import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/formz/email.dart';

part 'find_friend_form_cubit.freezed.dart';
part 'find_friend_form_state.dart';

@Injectable()
class FindFriendFormCubit extends Cubit<FindFriendFormState> {
  FindFriendFormCubit() : super(const FindFriendFormState.initial());

  void emailChanged(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      emit(state.copyWith(email: Email.dirty(value)));
    }
  }
}
