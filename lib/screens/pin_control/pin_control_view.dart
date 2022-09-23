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

    // Image dimensions
    double imageWidth = 634; // TODO get this value from a key on the widget
    double imageHeight = 698;

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
          left: state.pinList![index].side == Side.left ? 0 : imageWidth - 70, // 70 is the width of the pin buttons
          top: imageHeight * state.pinList![index].top,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: Stack(
                  children: pinButtons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
