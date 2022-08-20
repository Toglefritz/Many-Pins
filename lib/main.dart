import 'package:flutter/material.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';

void main() {
  runApp(const ManyPinsApp());
}

class ManyPinsApp extends StatelessWidget {
  const ManyPinsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Many Pins',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: const AvailablePortsSelectionRoute(),
    );
  }
}
