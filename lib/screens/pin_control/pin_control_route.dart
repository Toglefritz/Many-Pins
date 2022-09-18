import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/pin_control_controller.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';

/// Presents an interface allowing control over the individual PINs on the microcontroller board.
///
/// Every Arduino-compatible microcontroller board intended to be used with this app has a collection of
/// GPIO pins. These pins can generally function either as inputs or outputs. This screen presents an interface
/// showing a visual depiction of the target microcontroller including buttons for each GPIO pin. Each PIN can
/// be selected and controlled via commands sent over serial. The companion sketch receives these commands
/// and controls the GPIO pins according to the command contents. In other words, this route allows you to
/// read from and write to the microcontroller's GPIO pins.
class PinControlRoute extends StatefulWidget {
  static const String routeName = '/pin_control';

  const PinControlRoute({Key? key, required this.device}) : super(key: key);

  final SerialDevice device;

  @override
  PinControlController createState() => PinControlController();
}
