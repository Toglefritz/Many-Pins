import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/components/pin_button.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'models/side.dart';
import 'pin_control_controller.dart';

/// View for [PinControlRoute].
class PinControlView extends StatelessWidget {
  final PinControlController state;

  const PinControlView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The Widgets comprising the GPIO pin control UI
    List<Widget> pinButtons = [];

    // Get the screen dimensions
    Size windowSize = MediaQuery.of(context).size;

    // Get the width of the screen
    double imageWidth = 630;

    // Add the image of the microcontroller board
    pinButtons.add(
      Center(
        child: Image.asset(
          state.microcontrollerImage!,
        ),
      ),
    );

    // Add buttons for each GPIO pin on the board
    for (int index = 0; index < state.pinList!.length; index++) {
      pinButtons.add(
        Positioned(
          left: state.pinList![index].side == Side.left
              ? windowSize.width / 2 - imageWidth / 2 + 15
              : windowSize.width / 2 + imageWidth / 2 - 85,
          top: windowSize.height * state.pinList![index].top,
          child: PinButton(
            onPressed: () => {},
            text: state.pinList![index].label,
            side: state.pinList![index].side,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.pinControlTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Stack(
        children: pinButtons,
      ),
    );
  }
}
