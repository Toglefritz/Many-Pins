import '../pin.dart';
import '../side.dart';

/// This [List] lists all the PINs on the Arduino Uno microcontroller board, in the form of a list of [Pin]
/// objects. The [Pin] objects contain information about where the pins should be placed inside of a [Positioned]
/// widget so that they line up correctly with the microcontroller board diagram.
List<Pin> unoPins = [
  Pin.labeled(pinNumber: 0, top: 0.735, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 1, top: 0.767, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 2, top: 0.799, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 3, top: 0.831, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 4, top: 0.863, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 5, top: 0.895, analog: true, pwm: false, side: Side.left),
  Pin.labeled(pinNumber: 0, top: 0.895, analog: false, pwm: false, additionalLabel: 'RX', side: Side.right),
  Pin.labeled(pinNumber: 1, top: 0.863, analog: false, pwm: false, additionalLabel: 'TX', side: Side.right),
  Pin.labeled(pinNumber: 2, top: 0.831, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 3, top: 0.799, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 4, top: 0.767, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 5, top: 0.735, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 6, top: 0.703, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 7, top: 0.671, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 8, top: 0.619, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 9, top: 0.587, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 10, top: 0.555, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 11, top: 0.523, analog: false, pwm: true, side: Side.right),
  Pin.labeled(pinNumber: 12, top: 0.491, analog: false, pwm: false, side: Side.right),
  Pin.labeled(pinNumber: 13, top: 0.459, analog: false, pwm: false, side: Side.right),
];
