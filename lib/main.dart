import 'package:flutter/material.dart';
import 'package:many_pins/screens/app_loading/app_loading_route.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';
import 'package:many_pins/screens/firmware_upload_intro/firmware_upload_intro_route.dart';
import 'package:many_pins/screens/install_core/install_core_route.dart';
import 'package:many_pins/screens/update_index/update_index_route.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
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
            home: const AppLoadingRoute(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case UpdateIndexRoute.routeName:
                  return MaterialPageRoute(
                    builder: (context) {
                      return const UpdateIndexRoute();
                    },
                  );
                case AvailablePortsSelectionRoute.routeName:
                  return MaterialPageRoute(
                    builder: (context) {
                      return const AvailablePortsSelectionRoute();
                    },
                  );
                case FirmwareUploadIntroRoute.routeName:
                  final arguments = settings.arguments as SerialDevice;

                  return MaterialPageRoute(
                    builder: (context) {
                      return FirmwareUploadIntroRoute(
                        device: arguments,
                      );
                    },
                  );
                case InstallCoreRoute.routeName:
                  final arguments = settings.arguments as SerialDevice;

                  return MaterialPageRoute(
                    builder: (context) {
                      return InstallCoreRoute(
                        device: arguments,
                      );
                    },
                  );
                default:
                  assert(false, 'Need to implement ${settings.name}');
                  return null;
              }
            },
          );
        },
      ),
    );
  }
}
