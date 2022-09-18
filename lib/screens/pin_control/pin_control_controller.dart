import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/pin_control_form_view.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
import '../../services/arduino_cli/models/board.dart';
import 'models/microcontrollers.dart';
import 'pin_control_route.dart';
import 'pin_control_view.dart';

/// Controller for [PinControlRoute].
class PinControlController extends State<PinControlRoute> {
  String? microcontrollerImage;

  @override
  void initState() {
    PinControlRoute parentWidget = widget;
    SerialDevice device = parentWidget.device;
    List<Board>? matchingBoards = device.matchingBoards;

    microcontrollerImage = microcontrollers[matchingBoards?[0].fqbn?.boardId]?.image;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (microcontrollerImage != null) {
      return PinControlView(this);
    }
    // If there is no configuration for the current board, display a generic form allowing control with arbitrary
    // parameters
    else {
      return PinControlFormView(this);
    }
  }
}
