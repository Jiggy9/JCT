import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void changeTheme(ThemeMode themeMode) {
    state = themeMode;
  }

  void switchTheme(bool currentValue) {
    if (currentValue) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }

 
}
