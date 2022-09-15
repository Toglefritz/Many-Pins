import 'package:flutter/material.dart';
import '../../services/arduino_cli/models/serial_device.dart';
import 'upload_firmware_controller.dart';

/// Uploads the Many Pins companion app to the target board
class UploadFirmwareRoute extends StatefulWidget {
  static const String routeName = '/upload_firmware';

  const UploadFirmwareRoute({Key? key, required this.device}) : super(key: key);

  final SerialDevice device;

  @override
  UploadFirmwareController createState() => UploadFirmwareController();
}
