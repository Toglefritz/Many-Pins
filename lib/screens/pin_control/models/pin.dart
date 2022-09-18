/// Represents a button used to control a GPIO pin on a microcontroller. This class contains information
/// about the GPIO pin controlled by the button and about the position of the button when placed in
/// a [Positioned] widget.
class Pin {
  final int pinNumber;
  final double top;
  final double left;

  Pin({required this.pinNumber, required this.top, required this.left});
}
