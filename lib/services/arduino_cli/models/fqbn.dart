/// Represents the Fully-Qualified-Board-Name (FQBN) for the default configuration of this board
class FQBN {
  final String? name;
  final String? architecture;
  final String? boardId;
  final String? core;
  final String? full;

  FQBN({this.name, this.architecture, this.boardId, this.core, this.full});

  factory FQBN.fromBoardList(String boardListFQBN) {
    // Split the FQBN into its individual parts
    // ignore: non_constant_identifier_names
    List<String?> FQBNParts = boardListFQBN.split(':');

    String? name = FQBNParts[0];
    String? architecture = FQBNParts[1];
    String? boardId = FQBNParts[2];

    String? core = '$name:$architecture';

    return FQBN(
      name: name,
      architecture: architecture,
      boardId: boardId,
      core: core,
      full: boardListFQBN,
    );
  }
}
