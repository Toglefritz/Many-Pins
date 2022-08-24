import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'available_ports_selection_controller.dart';
import 'components/serial_port_list.dart';

/// View for [AvailableDeviceSelectionRoute].
///
/// This view is the starting point for the Many Pins app. The main part of the
/// UI presents a list of serial ports available on the host device. The user
/// is prompted to choose among the available ports to begin serial
/// communication with the device on that port.
class AvailablePortsSelectionView extends StatelessWidget {
  final AvailablePortsSelectionController state;

  const AvailablePortsSelectionView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.availablePortsPageTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SerialPortList(state: state),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.initPorts,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
