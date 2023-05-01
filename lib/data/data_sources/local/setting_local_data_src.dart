import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SettingLocalDataSrc {
  static Box? _box;
  final String _settingBox = "setting_box";
  final String _themeKeyName = "theme_key";
  final String _langKeyName = "lang_key";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_settingBox);
    return _box!;
  }

  Future<void> setThemeLocal(String value) async {
    await _openBox().then((box) async {
      await box.put(_themeKeyName, value);
    });
  }

  Future<String> getThemeValue() async {
    return await _openBox().then((box) {
      return box.get(_themeKeyName, defaultValue: "System");
    });
  }

  Stream<String?> getThemeStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _themeKeyName).map((event) {
      return event.value;
    });
  }

  Future<void> setLangLocal(String value) async {
    await _openBox().then((box) async {
      await box.put(_langKeyName, value);
    });
  }

  Future<String> getLangValue() async {
    return await _openBox().then((box) {
      return box.get(_langKeyName, defaultValue: "System");
    });
  }

  Stream<String?> getLangStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _langKeyName).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxAuth() async {
    await Hive.box(_settingBox).clear();
  }
}
