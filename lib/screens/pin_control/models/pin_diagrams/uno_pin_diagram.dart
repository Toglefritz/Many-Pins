import '../pin.dart';
import '../side.dart';

/// This [List] lists all the PINs on the Arduino Uno microcontroller board, in the form of a list of [Pin]
/// objects. The [Pin] objects contain information about where the pins should be placed inside of a [Positioned]
/// widget so that they line up correctly with the microcontroller board diagram.
List<Pin> unoPins = [
  Pin.labeled(pinNumber: 0, top: 0.672, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 1, top: 0.702, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 2, top: 0.732, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 3, top: 0.762, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 4, top: 0.792, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 5, top: 0.822, analog: true, pwm: false, side: Side.left),

  Pin.labeled(pinNumber: 0, top: 0.822, analog: false, pwm: false, additionalLabel: 'RX', side: Side.right),
  Pin.labeled(pinNumber: 1, top: 0.792, analog: false, pwm: false, additionalLabel: 'TX', side: Side.right),
  Pin.labeled(pinNumber: 2, top: 0.762, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 3, top: 0.732, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 4, top: 0.702, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 5, top: 0.672, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 6, top: 0.642, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 7, top: 0.612, analog: false, pwm: false, side: Side.right),

  Pin.labeled(pinNumber: 8, top: 0.57, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 9, top: 0.54, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 10, top: 0.51, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 11, top: 0.48, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 12, top: 0.45, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 13, top: 0.42, analog: false, pwm: false, side: Side.right),
  // TODO add remaining pins
];
