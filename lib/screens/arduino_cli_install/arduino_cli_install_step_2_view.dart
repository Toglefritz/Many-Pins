import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/clear_button.dart';
import '../../components/step_indicator.dart';
import '../../values/strings.dart';
import 'arduino_cli_install_controller.dart';

/// View for [ArduinoCliInstallRoute].
class ArduinoCliInstallStep2View extends StatelessWidget {
  final ArduinoCliInstallController state;

  const ArduinoCliInstallStep2View(this.state, {Key? key}) : super(key: key);

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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
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
                  Strings.step2,
                  style: TextStyle(fontSize: 42),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  Strings.extractCliInstructions,
                  textAlign: TextAlign.center,
                ),
              ),
              ClearButton(
                onPressed: state.openDownloads,
                text: Strings.unzipAndMove.toUpperCase(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => state.goToStep(1),
                            child: const StepIndicator(filled: false),
                          ),
                          const StepIndicator(filled: true),
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
      ),
    );
  }
}
