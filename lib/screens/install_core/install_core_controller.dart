import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/arduino_cli.dart';
import 'install_core_route.dart';
import 'install_core_view.dart';

/// Controller for [FirmwareUploadIntroRoute].
class InstallCoreController extends State<InstallCoreRoute> {
  bool firmwareUploading = false;

  @override
  void initState() {
    installCore();

    super.initState();
  }

  /// Starts the install process for the core needed to communicate with the selected device
  Future<void> installCore() async {
    bool installationSuccessful = false;
    if (widget.device.matchingBoards?[0].fqbn?.core != null) {
      bool installationSuccessful = await ArduinoCLI.installCore(widget.device.matchingBoards![0].fqbn!.core!);

      if (installationSuccessful) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // TODO Navigator.pushNamed(context, CompileSketch.routeName,);
        });
      }
    }

    if (!installationSuccessful) {
      // TODO display an error page
    }
  }

  @override
  Widget build(BuildContext context) => InstallCoreView(this);
}
