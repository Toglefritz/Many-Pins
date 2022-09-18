import 'package:many_pins/screens/pin_control/models/pin_diagrams/uno_pin_diagram.dart';
import 'microcontroller_board.dart';

String pathPrefix = 'assets/board_images';

/// A map between the board name obtained via the FQBN and a [MicrocontrollerBoard] object that contains information
/// about the microcontroller.
Map<String, MicrocontrollerBoard> microcontrollers = {
  'uno': MicrocontrollerBoard(image: '$pathPrefix/arduino_uno.png', pinList: unoPins),
  // TODO add other boards
};
