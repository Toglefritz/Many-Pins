import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
import 'install_core_controller.dart';

/// Installs the core necessary to interact with the target board.
class InstallCoreRoute extends StatefulWidget {
  static const String routeName = '/install_core';

  const InstallCoreRoute({Key? key, required this.device}) : super(key: key);

  final SerialDevice device;

  @override
  InstallCoreController createState() => InstallCoreController();
}
