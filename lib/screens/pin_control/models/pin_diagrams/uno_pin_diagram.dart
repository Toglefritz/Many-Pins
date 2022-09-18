import '../pin.dart';

/// This [List] lists all the PINs on the Arduino Uno microcontroller board, in the form of a list of [Pin]
/// objects. The [Pin] objects contain information about where the pins should be placed inside of a [Positioned]
/// widget so that they line up correctly with the microcontroller board diagram.
List<Pin> unoPins = [
  Pin(pinNumber: 1, top: 0.74, left: 0.5),
  // TODO add remaining pins
];
