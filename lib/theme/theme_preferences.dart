import 'package:shared_preferences/shared_preferences.dart';

/// Manages user preferences related to the app's theming
class ThemePreferences {
  static const String themePreferencesKey = "darkThemeEnabled";

  /// Sets a boolean to determine if dark theming is enabled
  void setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themePreferencesKey, value);
  }

  /// Toggles the current dark mode setting
  void toggleDarkModeSetting(bool currentDarkThemeSetting) {
    setDarkTheme(!currentDarkThemeSetting);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // If the preference has not been set, default to using a dark theme
    return prefs.getBool(themePreferencesKey) ?? true;
  }
}
