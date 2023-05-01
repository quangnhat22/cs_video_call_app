import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart';

part 'edit_language_state.dart';
part 'edit_language_cubit.freezed.dart';

@Injectable()
class EditLanguageCubit extends Cubit<EditLanguageState> {
  EditLanguageCubit({required this.usecase})
      : super(const EditLanguageState.initial()) {
    getCurrentLang();
  }

  final AppSettingsUseCase usecase;

  Future<void> getCurrentLang() async {
    final currentLang = await usecase.getAppLang();
    emit(state.copyWith(lang: currentLang));
  }

  Future<void> appThemeChanged(String value) async {
    await usecase.setAppLang(value);
    emit(state.copyWith(lang: value));
  }
}
