import 'package:flutter/material.dart';
import 'available_ports_selection_route.dart';
import 'available_ports_selection_view.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

/// Controller for [AvailablePortsSelectionRoute].
class AvailablePortsSelectionController
    extends State<AvailablePortsSelectionRoute> {
  /// A list of [SerialPort]s available from the system.
  List<SerialPort> availablePorts = [];

  @override
  void initState() {
    super.initState();
    initPorts();
  }

  /// Get a list of available serial ports from the host system.
  void initPorts() {
    setState(() {
      List<String> availablePortAddresses = SerialPort.availablePorts;

      for (String address in availablePortAddresses) {
        if (!availablePorts.contains(SerialPort(address))) {
          availablePorts.add(SerialPort(address));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => AvailablePortsSelectionView(this);
}
