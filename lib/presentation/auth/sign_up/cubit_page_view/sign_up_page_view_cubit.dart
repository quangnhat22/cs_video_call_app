import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

part 'sign_up_page_view_cubit.freezed.dart';
part 'sign_up_page_view_state.dart';

@Injectable()
class SignUpPageViewCubit extends Cubit<SignUpPageViewState> {
  SignUpPageViewCubit(
      {required AuthRepository authRepo, required UserRepository userRepo})
      : _authRepo = authRepo,
        _userRepo = userRepo,
        super(const SignUpPageViewState.initial());

  final AuthRepository _authRepo;
  final UserRepository _userRepo;

  void pageIndexChanged(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  Future<void> checkUserEmailVerified() async {
    try {
      // final user = await _userRepo.getSelf();
      // print(user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> close() {
    _authRepo.removeFlagSignUpNavigator();
    _authRepo.logOut();
    return super.close();
  }
}
