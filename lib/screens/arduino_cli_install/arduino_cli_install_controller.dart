import 'package:flutter/material.dart';
import '../../services/url_launcher/url_launcher.dart';
import 'arduino_cli_install_route.dart';
import 'arduino_cli_install_step_0_view.dart';
import 'arduino_cli_install_step_1_view.dart';
import 'arduino_cli_install_step_2_view.dart';
import 'arduino_cli_install_step_3_view.dart';

/// Controller for [ArduinoCliInstallRoute].
class ArduinoCliInstallController extends State<ArduinoCliInstallRoute> {
  // The step in the process of installing and setting up the Arduino CLI
  int step = 0;

  /// Advances the step of the Arduino CLI installation process
  void advanceToNextStep() {
    setState(() {
      step++;
    });
  }

  /// Downloads the installer for the Arduino CLI
  // TODO add support for other operating systems
  Future<void> downloadCli() async {
    // Open the Arduino CLI download link
    await UrlLauncher.launch(UrlLauncher.arduinoCliDownload);

    advanceToNextStep();
  }

  /// Opens the system Downloads folder
  Future<void> openDownloads() async {
    await UrlLauncher.openDownloads();

    advanceToNextStep();
  }

  /// Navigates to a specific step of the Arduino CLI setup process
  void goToStep(int targetStep) {
    setState(() {
      step = targetStep;
    });
  }

  /// Loads a route containing detailed instructions for setting up the system environment variables
  void editPathDetails() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, '/edit_path');
    });
  }

  /// Navigates back to the [AppLoadingRoute] to verify installation of the Arduino CLI
  void verifyCliInstallation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (step) {
      case 0:
        return ArduinoCliInstallStep0View(this);
      case 1:
        return ArduinoCliInstallStep1View(this);
      case 2:
        return ArduinoCliInstallStep2View(this);
      case 3:
        return ArduinoCliInstallStep3View(this);
      default:
        return const SizedBox.shrink(); // TODO display setup error page
    }
  }
}
