import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/pin_control_form_view.dart';
import 'models/microcontroller_board.dart';
import 'models/microcontrollers.dart';
import 'models/pin.dart';
import 'pin_control_route.dart';
import 'pin_control_view.dart';

/// Controller for [PinControlRoute].
class PinControlController extends State<PinControlRoute> {
  // The target microcontroller board connected to the app currently
  MicrocontrollerBoard? board;

  // Information about how to render the pin control interface
  String? microcontrollerImage;
  List<Pin>? pinList;

  // A key for the microcontroller image
  GlobalKey imageKey = GlobalKey();

  @override
  void initState() {
    // Get the MicrocontrollerBoard from the provided SerialDevice object
    board = microcontrollers[widget.device.matchingBoards?[0].fqbn?.boardId];

    // Populate the UI parameters
    microcontrollerImage = board?.image;
    pinList = board?.pinList;

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
