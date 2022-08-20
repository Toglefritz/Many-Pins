import 'package:flutter/material.dart';
import 'available_ports_selection_controller.dart';

/// Allows the user to select a serial port on the host device through which
/// to establish serial communication with the target microcontroller.
///
/// The main UI element for this screen is a list of serial ports available on
/// the host machine. The [AvailablePortsSelectionController] obtains a list
/// of serial ports using the libserial plugin. The app then displays the list
/// of ports, including information about the serial ports when it is available
/// from the system.
class AvailablePortsSelectionRoute extends StatefulWidget {
  const AvailablePortsSelectionRoute({Key? key}) : super(key: key);

  @override
  AvailablePortsSelectionController createState() =>
      AvailablePortsSelectionController();
}
