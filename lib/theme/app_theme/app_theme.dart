import 'package:flutter/material.dart';
import 'package:jct/theme/app_theme/app_color_extention.dart';
import 'package:jct/theme/app_theme/app_pallete.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: AppPalette.seashell,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: AppPalette.darkGrey,
    onPrimary: AppPalette.grey,
    secondary: AppPalette.moderateMagenta,
    onSecondary: Colors.white,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: AppPalette.black,
    onBackground: AppPalette.seashell,
    // surface: AppPalette.darkMagenta,
    surface: Color(0xFF4A4A4A),
    onSurface: AppPalette.vibrantMagenta,
  );
}

// extensions
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}

extension ThemeDataExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
