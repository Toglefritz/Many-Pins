import 'package:flutter/material.dart';
import 'package:many_pins/screens/available_ports_selection/available_ports_selection_route.dart';
import '../../services/arduino_cli/arduino_cli.dart';
import 'update_index_route.dart';
import 'update_index_view.dart';

/// Controller for [AppLoadingRoute].
class UpdateIndexController extends State<UpdateIndexRoute> {
  @override
  void initState() {
    // Run an Arduino CLI command to update the CLI index
    updateCliIndex();

    super.initState();
  }

  /// Update the Arduino CLI cache
  Future<void> updateCliIndex() async {
    await ArduinoCLI.updateCliIndex();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(
        context,
        AvailablePortsSelectionRoute.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) => UpdateIndexView(this);
}
