import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_page_view_state.dart';
part 'sign_up_page_view_cubit.freezed.dart';

@Injectable()
class SignUpPageViewCubit extends Cubit<SignUpPageViewState> {
  SignUpPageViewCubit() : super(const SignUpPageViewState.initial());

  void pageIndexChanged(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
