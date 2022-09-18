import 'package:flutter/material.dart';
import '../../services/arduino_cli/arduino_cli.dart';
import '../pin_control/pin_control_route.dart';
import 'upload_firmware_route.dart';
import 'upload_firmware_view.dart';

/// Controller for [UploadFirmwareRoute].
class UploadFirmwareController extends State<UploadFirmwareRoute> {
  @override
  void initState() {
    // Run an Arduino CLI command to upload the firmware
    uploadFirmware();

    super.initState();
  }

  /// Update the Arduino CLI cache
  Future<void> uploadFirmware() async {
    await ArduinoCLI.uploadFirmware(widget.device);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(
        context,
        PinControlRoute.routeName,
        arguments: widget.device,
      );
    });
  }

  @override
  Widget build(BuildContext context) => UploadFirmwareView(this);
}
