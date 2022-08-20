import 'package:flutter/material.dart';
import 'available_ports_selection_controller.dart';

/// Allows the user to select a serial port on the host device through which
/// to establish serial communication with the target microcontroller.
class AvailablePortsSelectionRoute extends StatefulWidget {
  const AvailablePortsSelectionRoute({Key? key}) : super(key: key);

  @override
  AvailablePortsSelectionController createState() =>
      AvailablePortsSelectionController();
}
