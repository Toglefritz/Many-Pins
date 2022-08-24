import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_preference_provider.dart';

/// A button used to toggle dark mode on and off
class BrightnessToggle extends StatelessWidget {
  const BrightnessToggle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemePreferenceProvider>(context);

    return Consumer<ThemePreferenceProvider>(
      builder: (BuildContext context, ThemePreferenceProvider themePreference, Widget? child) {
        return IconButton(
          onPressed: () => themeChange.darkTheme = !themeChange.darkTheme,
          icon: themePreference.darkTheme ? const Icon(Icons.brightness_2_outlined) : const Icon(Icons.brightness_7),
        );
      },
    );
  }
}
