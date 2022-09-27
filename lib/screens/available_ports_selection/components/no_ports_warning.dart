import 'package:flutter/material.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';
import '../../../values/strings.dart';

/// A warning/message displayed if no serial ports to which Arduino boards are attached are detected.
class NoPortsWarning extends StatelessWidget {
  const NoPortsWarning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(
                Icons.error_outline,
                size: 42,
              ),
            ),
            Text(
              Strings.noPorts.toUpperCase(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: const Icon(
                  Icons.refresh,
                  size: 32,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, AvailablePortsSelectionRoute.routeName),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
