import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'pin_control_controller.dart';

/// View for [PinControlRoute].
class PinControlView extends StatelessWidget {
  final PinControlController state;

  const PinControlView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.installingCoreTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Center(
        child: Image.asset(state.microcontrollerImage!),
      ),
    );
  }
}
