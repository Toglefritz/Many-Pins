import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/clear_button.dart';
import '../../values/strings.dart';
import 'edit_path_details_controller.dart';

/// View for [EditPathDetailsRoute].
class EditPathDetailsView extends StatelessWidget {
  final EditPathDetailsController state;

  const EditPathDetailsView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.editPathInstructions),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.pathVariableDescription,
                    textAlign: TextAlign.center,
                  ),
                ),

                // STEP 1
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    Strings.openSystemProperties,
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.openSystemPropertiesDescription,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/open_system_variables.png',
                  width: 500,
                ),

                // STEP 2
                const Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 10),
                  child: Text(
                    Strings.openEnvironmentVariables,
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.openEnvironmentVariablesDescription,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/environment_variables_button.png',
                  width: 500,
                ),

                // STEP 3
                const Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 10),
                  child: Text(
                    Strings.selectSystemPath,
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.selectSystemPathDescription,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/select_system_path_variable.png',
                  width: 500,
                ),

                // STEP 4
                const Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 10),
                  child: Text(
                    Strings.addArduinoCliPath,
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.selectSystemPathDescription,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/add_arduino_cli_location_to_path.png',
                  width: 500,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: ClearButton(
                    onPressed: state.verifyCliInstallation,
                    text: Strings.verifyInstallation.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
