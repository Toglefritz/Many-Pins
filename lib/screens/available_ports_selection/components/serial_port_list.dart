import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import '../../../components/card_list_view.dart';
import '../available_ports_selection_controller.dart';

/// Displays a list of serial ports including information about the ports.
class SerialPortList extends StatelessWidget {
  const SerialPortList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AvailablePortsSelectionController state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.availablePorts.length,
      itemBuilder: (BuildContext context, int index) {
        SerialPort port = state.availablePorts[index];

        return Card(
          child: ExpansionTile(
            title: Text(port.name ?? 'Unknown'),
            children: [
              if (port.name != null)
                CardListTile(name: 'Description', value: port.description),
              if (port.vendorId != null)
                CardListTile(
                    name: 'Vendor ID', value: port.vendorId?.toString()),
              if (port.productId != null)
                CardListTile(
                    name: 'Product ID', value: port.productId?.toString()),
              if (port.manufacturer != null)
                CardListTile(name: 'Manufacturer', value: port.manufacturer),
              CardListTile(name: 'Address', value: port.address.toString()),
              if (port.serialNumber != null)
                CardListTile(name: 'Serial Number', value: port.serialNumber),
              if (port.macAddress != null)
                CardListTile(name: 'MAC Address', value: port.macAddress),
            ],
          ),
        );
      },
    );
  }
}
