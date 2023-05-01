part of setting_dash_board;

@Injectable()
class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required this.authRepo,
  }) : super(const SettingState.initial());

  final AuthRepository authRepo;

  Future<void> onTapLogOutBtn() async {
    await authRepo.logOut();
  }
}
