import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/clear_button.dart';
import '../../components/step_indicator.dart';
import '../../values/strings.dart';
import 'arduino_cli_install_controller.dart';

/// View for [ArduinoCliInstallRoute].
class ArduinoCliInstallStep3View extends StatelessWidget {
  final ArduinoCliInstallController state;

  const ArduinoCliInstallStep3View(this.state, {Key? key}) : super(key: key);

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
                  Strings.step3,
                  style: TextStyle(fontSize: 42),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  Strings.addEnvironmentVariables,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: TextButton(
                  onPressed: state.editPathDetails,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Strings.moreDetails,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClearButton(
                onPressed: state.verifyCliInstallation,
                text: Strings.verifyInstallation.toUpperCase(),
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
                          GestureDetector(
                            onTap: () => state.goToStep(2),
                            child: const StepIndicator(filled: false),
                          ),
                          const StepIndicator(filled: true),
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
