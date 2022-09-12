import 'package:flutter/material.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';

/// A button used to refresh the list of available serial ports
class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => Navigator.pushReplacementNamed(context, AvailablePortsSelectionRoute.routeName),
      ),
    );
  }
}
