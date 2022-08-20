import 'package:flutter/material.dart';
import 'available_ports_selection_route.dart';
import 'available_ports_selection_view.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

/// Controller for [AvailablePortsSelectionRoute].
class AvailablePortsSelectionController
    extends State<AvailablePortsSelectionRoute> {
  // A list of [SerialPort]s available from the system.
  List<SerialPort> availablePorts = [];

  @override
  void initState() {
    super.initState();
    initPorts();
  }

  /// Get a list of available serial ports from the host system.
  void initPorts() {
    setState(() {
      // Clear the list of serial ports before building it back up
      availablePorts.clear();

      // Get a list of serial ports by address
      List<String> availablePortAddresses = SerialPort.availablePorts;

      // Build a list of SerialPort objects from the list of addresses
      for (String address in availablePortAddresses) {
        availablePorts.add(SerialPort(address));
      }
    });
  }

  @override
  Widget build(BuildContext context) => AvailablePortsSelectionView(this);
}
