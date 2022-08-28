import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/clear_button.dart';
import '../../values/strings.dart';
import 'arduino_cli_install_controller.dart';

/// View for [ArduinoCliInstallRoute].
class ArduinoCliInstallStep0View extends StatelessWidget {
  final ArduinoCliInstallController state;

  const ArduinoCliInstallStep0View(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.installArduinoCli),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                Strings.cliNotInstalledExplainer,
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/arduino_cli_logo.png',
              width: 400,
            ),
            ClearButton(
              onPressed: state.advanceToNextStep,
              text: Strings.getStarted.toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
