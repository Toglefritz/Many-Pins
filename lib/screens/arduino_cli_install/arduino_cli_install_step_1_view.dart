import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/clear_button.dart';
import '../../components/step_indicator.dart';
import '../../values/strings.dart';
import 'arduino_cli_install_controller.dart';

/// View for [ArduinoCliInstallRoute].
class ArduinoCliInstallStep1View extends StatelessWidget {
  final ArduinoCliInstallController state;

  const ArduinoCliInstallStep1View(this.state, {Key? key}) : super(key: key);

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
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                Strings.step1,
                style: TextStyle(fontSize: 42),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                Strings.downloadCli,
                textAlign: TextAlign.center,
              ),
            ),
            ClearButton(
              onPressed: state.downloadCli,
              text: Strings.download.toUpperCase(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const StepIndicator(filled: true),
                        GestureDetector(
                          onTap: () => state.goToStep(2),
                          child: const StepIndicator(filled: false),
                        ),
                        GestureDetector(
                          onTap: () => state.goToStep(3),
                          child: const StepIndicator(filled: false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
