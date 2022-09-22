import 'package:many_pins/screens/pin_control/models/side.dart';

/// Represents a button used to control a GPIO pin on a microcontroller. This class contains information
/// about the GPIO pin controlled by the button and about the position of the button when placed in
/// a [Positioned] widget.
///
/// To determine the position of the [PinButton] created to represent this [Pin], a [Positioned] widget containing
/// the [PinButton] will use the [top] value to determine the space between the screen's top and the button. The
/// horizontal position is determined by the microcontroller image's dimensions. The [PinButton] will be positioned
/// 20 pixels to the left or right, depending upon the [side] field, of the microcontroller image.
///
/// The [pin], [pwm], and [additionalLabel] fields are all used together to determine the value of the [label] field
/// in the constructor. The [label] String is the value displayed in the [PinButton] representing this pin.
class Pin {
  final int pinNumber;
  final double top;
  final bool analog;
  final bool pwm;
  final String? additionalLabel;
  final String label;
  final Side side;

  Pin({
    required this.pinNumber,
    required this.top,
    required this.analog,
    required this.pwm,
    this.additionalLabel,
    required this.label,
    required this.side,
  });

  factory Pin.labeled({
    required int pinNumber,
    required double top,
    required bool analog,
    required bool pwm,
    String? additionalLabel,
    required Side side,
  }) {
    // Build the label to display for the pin button
    String label = '${additionalLabel ?? ''} ${pwm == true ? '~' : ''}${analog == true ? 'A' : ''}$pinNumber';

    return Pin(
      pinNumber: pinNumber,
      top: top,
      analog: analog,
      pwm: pwm,
      additionalLabel: additionalLabel,
      label: label,
      side: side,
    );
  }
}
