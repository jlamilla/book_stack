import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  static const String _themeKey = 'theme_mode';

  @override
  Future<ThemeMode> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? themeString = prefs.getString(_themeKey);

    if (themeString != null) {
      switch (themeString) {
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        case 'system':
        default:
          return ThemeMode.system;
      }
    }
    return ThemeMode.system;
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = AsyncValue<ThemeMode>.data(mode);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }

  Future<void> toggleTheme() async {
    final ThemeMode current = state.value ?? ThemeMode.system;
    final ThemeMode next = current == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setTheme(next);
  }

  ThemeMode get currentTheme => state.value ?? ThemeMode.system;
}

final AsyncNotifierProvider<ThemeNotifier, ThemeMode> themeNotifierProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);
