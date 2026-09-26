import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_provider.g.dart';

const themeModePreferenceKey = 'theme_mode';

class ThemeModeStore {
  ThemeModeStore(this._preferences);

  final SharedPreferencesAsync _preferences;

  Future<ThemeMode> load() async {
    final value = await _preferences.getString(themeModePreferenceKey);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.dark,
    );
  }

  Future<void> save(ThemeMode mode) {
    return _preferences.setString(themeModePreferenceKey, mode.name);
  }
}

@Riverpod(keepAlive: true)
ThemeModeStore themeModeStore(Ref ref) =>
    ThemeModeStore(SharedPreferencesAsync());

@Riverpod(keepAlive: true)
ThemeMode initialThemeMode(Ref ref) => ThemeMode.dark;

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => ref.read(initialThemeModeProvider);

  Future<void> setMode(ThemeMode mode) async {
    if (state == mode) return;

    await ref.read(themeModeStoreProvider).save(mode);
    state = mode;
  }
}
