/// Represents an Arduino-compatible microcontroller
class Board {
  final String? name;
  final String? fqbn;

  Board({this.name, this.fqbn});

  factory Board.fromJson(Map<String, dynamic> json) {
    String? name = json['name'];
    String? fqbn = json['fqbn'];

    return Board(name: name, fqbn: fqbn);
  }
}
