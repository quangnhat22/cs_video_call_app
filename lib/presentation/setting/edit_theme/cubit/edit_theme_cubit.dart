import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart';

part 'edit_theme_state.dart';
part 'edit_theme_cubit.freezed.dart';

@Injectable()
class EditThemeCubit extends Cubit<EditThemeState> {
  EditThemeCubit({required this.usecase})
      : super(const EditThemeState.initial()) {
    getCurrentTheme();
  }

  final AppSettingsUseCase usecase;

  Future<void> getCurrentTheme() async {
    final currentTheme = await usecase.getAppTheme();
    emit(state.copyWith(theme: currentTheme));
  }

  Future<void> appThemeChanged(String value) async {
    await usecase.setAppTheme(value);
    emit(state.copyWith(theme: value));
  }
}
