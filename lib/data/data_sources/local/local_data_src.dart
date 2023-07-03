import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/local/setting_local_data_src.dart';
import 'package:videocall/data/data_sources/local/user_local_data_src.dart';

@Singleton()
class LocalDataSource {
  final AuthLocalDataSrc _authLocal;
  final SettingLocalDataSrc _settingLocal;
  final UserLocalDataSrc _userLocal;

  LocalDataSource(this._authLocal, this._settingLocal, this._userLocal);

  Future<void> deleteAllLocal() async {
    await _authLocal.deleteBoxAuth();
    await _settingLocal.deleteBoxSetting();
    await _userLocal.deleteBoxUser();
  }
}
