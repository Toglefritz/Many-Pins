import 'package:flutter/material.dart';
import 'package:many_pins/theme/theme_preferences.dart';

/// A model for the theme preferences settings. Provides setters and getters
/// for theme-related values.
class ThemePreferenceProvider with ChangeNotifier {
  ThemePreferences darkThemePreference = ThemePreferences();

  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
