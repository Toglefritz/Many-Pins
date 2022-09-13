import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
import 'firmware_upload_intro_controller.dart';

/// Starts the process of uploading the companion app to the target board by displaying a warning about the process.
///
/// The Many Pins app and the companion Arduino sketch communicate with each other over serial. The sketch and the app
/// send JSON-formatted messages back and forth allowing the app to issue commands to the microcontroller and the
/// microcontroller to report back the results of executing those commands, as well as errors and debug statements.
class FirmwareUploadIntroRoute extends StatefulWidget {
  static const String routeName = '/firmware_upload_intro';

  const FirmwareUploadIntroRoute({Key? key, required this.device}) : super(key: key);

  final SerialDevice device;

  @override
  FirmwareUploadIntroController createState() => FirmwareUploadIntroController();
}
