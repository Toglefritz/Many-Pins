import 'package:many_pins/services/arduino_cli/models/serial_port.dart';
import 'board.dart';

/// A serial port on the host machine, including information about an Arduino-compatible microcontroller
/// that may be connected to that port
class SerialDevice {
  final List<Board>? matchingBoards;
  final SerialPort? port;

  SerialDevice({this.matchingBoards, this.port});

  factory SerialDevice.fromJson(Map<String, dynamic> json) {
    List<dynamic>? matchingBoardsList = json['matching_boards'];
    List<Board>? arduinoBoards = [];
    matchingBoardsList?.forEach((boardJson) {
      arduinoBoards.add(Board.fromJson(boardJson));
    });

    SerialPort? port = SerialPort.fromJson(json['port']);

    return SerialDevice(
      matchingBoards: arduinoBoards,
      port: port,
    );
  }
}
