import 'package:flutter/material.dart';
import '../../services/arduino_cli/arduino_cli.dart';
import 'update_index_route.dart';
import 'update_index_view.dart';

/// Controller for [AppLoadingRoute].
class UpdateIndexController extends State<UpdateIndexRoute> {
  @override
  void initState() {
    // Run an Arduino CLI command to check if the tool is available
    updateCliIndex();

    super.initState();
  }

  /// Update the Arduino CLI cache
  Future<void> updateCliIndex() async {
    await ArduinoCLI.updateCliIndex();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/available_ports_selection');
    });
  }

  @override
  Widget build(BuildContext context) => UpdateIndexView(this);
}
