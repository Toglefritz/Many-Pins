import 'package:many_pins/screens/pin_control/models/pin.dart';

/// Represents information about a microcontroller board necessary to build the GPIO pin control interface.
class MicrocontrollerBoard {
  final String image;
  final List<Pin> pinList;

  MicrocontrollerBoard({required this.image, required this.pinList});
}
