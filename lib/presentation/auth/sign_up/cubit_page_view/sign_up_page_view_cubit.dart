import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

part 'sign_up_page_view_cubit.freezed.dart';
part 'sign_up_page_view_state.dart';

@Injectable()
class SignUpPageViewCubit extends Cubit<SignUpPageViewState> {
  SignUpPageViewCubit({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(const SignUpPageViewState.initial());

  final AuthRepository _authRepo;

  void pageIndexChanged(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  @override
  Future<void> close() {
    _authRepo.removeFlagSignUpNavigator();
    return super.close();
  }
}
