import 'package:flutter/material.dart';
import 'package:many_pins/screens/pin_control/components/pin_button.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'components/pin_control_drawer.dart';
import 'models/side.dart';
import 'pin_control_controller.dart';

/// View for [PinControlRoute].
///
/// This view consists of three major parts:
///   1.  In the center of the view is an image of the target microcontroller board. This image exists purely for
///       visual reference.
///   2.  Along either side of the microcontroller image are collections of [PinButton]s, one for each of the
///       microcontroller's GPIO pins. These are the buttons that a user selects to send commands to control the
///       GPIO pin corresponding to the selected button.
///   3.  The [Scaffold] in this view has two drawers, one on the left and one on the right. These drawers open when
///       one of the [PinButton]s is selected. The [Drawer]s contain forms that allow the user to select the
///       parameters of the command to be sent to the microcontroller.
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
            onPressed: () => state.sendPinControlCommand(state.pinList![index]),
            text: state.pinList![index].label,
            side: state.pinList![index].side,
          ),
        ),
      );
    }

    return Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        title: const Text(Strings.pinControlTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: Stack(
                  children: pinButtons,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: PinControlDrawer(state: state),
      endDrawer: PinControlDrawer(state: state),
    );
  }
}
