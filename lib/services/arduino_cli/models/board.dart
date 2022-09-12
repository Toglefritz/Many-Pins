import 'fqbn.dart';

/// Represents an Arduino-compatible microcontroller
class Board {
  final String? name;
  final FQBN? fqbn;

  Board({this.name, this.fqbn});

  factory Board.fromJson(Map<String, dynamic> json) {
    String? name = json['name'];
    FQBN? fqbn = FQBN.fromBoardList(json['fqbn']);

    return Board(name: name, fqbn: fqbn);
  }
}
