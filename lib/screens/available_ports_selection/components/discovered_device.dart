import 'package:flutter/material.dart';
import '../../../services/arduino_cli/models/serial_device.dart';

/// Shows information about an Arduino-compatible device detected on a host device serial port
class DiscoveredDevice extends StatelessWidget {
  const DiscoveredDevice({
    Key? key,
    required this.device,
  }) : super(key: key);

  final SerialDevice? device;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.4,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Image.asset(
                  'assets/arduino_icon.png',
                  color: Theme.of(context).primaryColor,
                  width: 120,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Port: ${device?.port?.address ?? '-'}'),
                    Text('Board: ${device?.matchingBoards?[0].name ?? '-'}'),
                    Text('Protocol: ${device?.port?.protocol ?? '-'}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
