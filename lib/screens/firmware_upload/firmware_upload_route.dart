import 'package:flutter/material.dart';
import 'firmware_upload_controller.dart';

/// Uploads a companion Arduino sketch to the attached microcontroller board.
///
/// The Many Pins app and the companion Arduino sketch communicate with each other over serial. The sketch and the app
/// send JSON-formatted messages back and forth allowing the app to issue commands to the microcontroller and the
/// microcontroller to report back the results of executing those commands, as well as errors and debug statements.
class FirmwareUploadRoute extends StatefulWidget {
  const FirmwareUploadRoute({Key? key}) : super(key: key);

  @override
  FirmwareUploadController createState() => FirmwareUploadController();
}
