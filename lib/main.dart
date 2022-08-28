import 'package:flutter/material.dart';
import 'package:many_pins/screens/app_loading/app_loading_route.dart';
import 'package:many_pins/screens/arduino_cli_install/arduino_cli_install_route.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';
import 'package:many_pins/screens/edit_path_details/edit_path_details_route.dart';
import 'package:many_pins/screens/firmware_upload/firmware_upload_route.dart';
import 'package:many_pins/theme/theme_preference_provider.dart';
import 'package:many_pins/theme/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ManyPinsApp());
}

class ManyPinsApp extends StatefulWidget {
  const ManyPinsApp({Key? key}) : super(key: key);

  @override
  ManyPinsAppState createState() => ManyPinsAppState();
}

class ManyPinsAppState extends State<ManyPinsApp> {
  ThemePreferenceProvider themeProvider = ThemePreferenceProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  /// Get the current app theme
  void getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemePreferenceProvider>(
        builder: (BuildContext context, ThemePreferenceProvider themePreference, Widget? child) {
          return MaterialApp(
            title: 'Many Pins',
            debugShowCheckedModeBanner: false,
            themeMode: themePreference.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
            theme: Themes.getThemeData(themePreference.darkTheme, context),
            routes: {
              '/': (context) => const AppLoadingRoute(),
              '/availablePortsSelection': (context) => const AvailablePortsSelectionRoute(),
              '/firmwareUpload': (context) => const FirmwareUploadRoute(),
              '/install': (context) => const ArduinoCliInstallRoute(),
              '/edit_path': (context) => const EditPathDetailsRoute(),
            },
          );
        },
      ),
    );
  }
}
