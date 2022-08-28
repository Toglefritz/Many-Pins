import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primaryColor: Colors.white70,
        fontFamily: GoogleFonts.robotoMono().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16.0),
          bodyText2: TextStyle(fontSize: 20.0),
          button: TextStyle(fontSize: 22.0),
        ),
      );
    }
    // Light theme
    else {
      themeData = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.black54,
        fontFamily: GoogleFonts.robotoMono().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16.0),
          bodyText2: TextStyle(fontSize: 20.0),
          button: TextStyle(fontSize: 22.0),
        ),
      );
    }

    return themeData;
  }
}
