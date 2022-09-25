import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/pin_control_form_view.dart';
import '../../values/strings.dart';
import 'models/microcontroller_board.dart';
import 'models/microcontrollers.dart';
import 'models/pin.dart';
import 'models/side.dart';
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

  // A controller for the scaffold in the [PinControlView]
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Tracks the selected pin to display in the control form
  Pin? targetPin;

  // Variables related to the pin control forms presented in the drawers
  String operation = Strings.write;
  String inputMode = Strings.digital;
  String digitalWriteValue = Strings.high;

  // Variables for the input field used to set an analog write value
  TextEditingController writeValueController = TextEditingController();
  int previousValue = 0;

  @override
  void initState() {
    // Get the MicrocontrollerBoard from the provided SerialDevice object
    board = microcontrollers[widget.device.matchingBoards?[0].fqbn?.boardId];

    // Populate the UI parameters
    microcontrollerImage = board?.image;
    pinList = board?.pinList;

    super.initState();
  }

  /// Handles taps on the [PinButton]s by presenting the [Drawer] on the side of the [Scaffold] on which
  /// the [PinButton] appears.
  void sendPinControlCommand(Pin pin) {
    setState(() {
      targetPin = pin;
    });

    if (pin.side == Side.left) {
      openDrawer();
    } else {
      openEndDrawer();
    }
  }

  /// Opens the drawer.
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  /// Opens the end drawer.
  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  /// Closes the drawers.
  void closeDrawers() {
    Navigator.of(context).pop();
  }

  /// Handles taps on the operation mode selection [ChoiceChip]s
  void inputModeSelected(String selection) {
    setState(() {
      inputMode = selection;
    });
  }

  /// Handles taps on the input mode selection [ChoiceChip]s
  void operationSelected(String selection) {
    setState(() {
      operation = selection;
    });
  }

  /// Handles taps on the input mode selection [ChoiceChip]s
  void digitalWriteValueSelected(String selection) {
    setState(() {
      digitalWriteValue = selection;
    });
  }

  /// Handles changes to the input inside the write value [TextField]. Ensures
  /// that the input value is zero or greater and less than 255.
  void handleWriteValueChanged(String input) {
    int intInput = int.parse(input);
    if (intInput < 0) {
      writeValueController.text = '0';
    } else if (intInput > 255) {
      writeValueController.text = '255';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (microcontrollerImage != null) {
      return PinControlView(this);
    }
    // If there is no configuration for the current board, display a generic form
    // allowing control with arbitrary parameters
    else {
      return PinControlFormView(this);
    }
  }
}
