import 'package:flutter/material.dart';

/// Provides [ThemeData] based on [ThemePreferences].
class Themes {
  /// Returns [ThemeData] for a light or dark theme, depending upon current
  /// user preferences.
  static ThemeData getThemeData(bool darkThemeEnabled, BuildContext context) {
    ThemeData themeData;

    // Dark theme
    if (darkThemeEnabled) {
      themeData = ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF212121),
      );
    }
    // Light theme
    else {
      themeData = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      );
    }

    return themeData;
  }
}
