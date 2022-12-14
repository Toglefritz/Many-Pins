import 'package:flutter/material.dart';
import 'package:many_pins/screens/firmware_upload_intro/firmware_upload_intro_route.dart';
import '../../components/brightness_toggle.dart';
import '../../components/loading_indicator.dart';
import '../../services/arduino_cli/arduino_cli.dart';
import '../../services/arduino_cli/models/serial_device.dart';
import '../../values/strings.dart';
import 'available_ports_selection_controller.dart';
import 'components/discovered_device.dart';
import 'components/no_ports_warning.dart';
import 'components/refresh_button.dart';

/// View for [AvailableDeviceSelectionRoute].
///
/// This view presents a list of serial communication ports, identified to be hosting Arduino-compatible boards,
/// available on the host device. The user is prompted to choose among the available ports to begin serial
/// communication with the device on that port.
///
/// The list of ports is obtained using the Arduino CLI. Information about the ports is contained withing a
/// JSON response like
///
/// [
///   {
///     "matching_boards": [
///       {
///         "name": "Arduino Uno",
///         "fqbn": "arduino:avr:uno"
///       }
///     ],
///     "port": {
///       "address": "COM3",
///       "label": "COM3",
///       "protocol": "serial",
///       "protocol_label": "Serial Port (USB)",
///       "properties": {
///         "pid": "0x0043",
///         "serialNumber": "FFFFFFFFFFFF51147A97",
///         "vid": "0x2341"
///       }
///     }
///   },
///   {
///     "port": {
///       "address": "COM1",
///       "label": "COM1",
///       "protocol": "serial",
///       "protocol_label": "Serial Port"
///     }
///   }
/// ]
class AvailablePortsSelectionView extends StatelessWidget {
  final AvailablePortsSelectionController state;

  const AvailablePortsSelectionView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.availablePortsPageTitle),
        actions: const [
          RefreshButton(),
          BrightnessToggle(),
        ],
      ),
      body: FutureBuilder<List<SerialDevice>?>(
          future: ArduinoCLI.getSerialPorts(),
          builder: (BuildContext context, AsyncSnapshot<List<SerialDevice>?> devices) {
            if (devices.hasData) {
              if (devices.data?.isEmpty == true) {
                return const NoPortsWarning();
              } else {
                return Center(
                  child: SizedBox(
                    height: 235,
                    child: ListView.builder(
                      itemCount: devices.data?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, FirmwareUploadIntroRoute.routeName,
                              arguments: devices.data?[index]),
                          child: DiscoveredDevice(device: devices.data?[index]),
                        );
                      },
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LoadingIndicator(),
                  ],
                ),
              );
            }
          }),
    );
  }
}
