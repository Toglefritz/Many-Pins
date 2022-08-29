import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/arduino_cli.dart';
import 'package:many_pins/services/arduino_cli/models/arduino_cli_version.dart';
import 'app_loading_route.dart';
import 'app_loading_view.dart';

/// Controller for [AppLoadingRoute].
class AppLoadingController extends State<AppLoadingRoute> {
  @override
  void initState() {
    // Run an Arduino CLI command to check if the tool is available
    checkArduinoCliVersion();

    super.initState();
  }

  /// Call the [ArduinoCLI] method to check the current Arduino CLI version
  Future<void> checkArduinoCliVersion() async {
    ArduinoCLIVersion? versionInfo = await ArduinoCLI.checkArduinoCliVersion();

    // A null value indicates that the Arduino CLI is not installed
    if (versionInfo != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/availablePortsSelection');
      });
    } else {
      // TODO show Arduino CLI error
    }
  }

  @override
  Widget build(BuildContext context) => AppLoadingView(this);
}
