/// Represents information about a serial port on the host machine
class SerialPort {
  final String? address;
  final String? label;
  final String? protocol;
  final String? protocolLabel;
  final String? pid;
  final String? serialNumber;
  final String? vid;

  SerialPort({
    this.address,
    this.label,
    this.protocol,
    this.protocolLabel,
    this.pid,
    this.serialNumber,
    this.vid,
  });

  factory SerialPort.fromJson(Map<String, dynamic> json) {
    String? address = json['address'];
    String? label = json['label'];
    String? protocol = json['protocol'];
    String? protocolLabel = json['protocol_label'];
    String? pid = json['properties']?['pid'];
    String? serialNumber = json['properties']?['serialNumber'];
    String? vid = json['properties']?['vid'];

    return SerialPort(
      address: address,
      label: label,
      protocol: protocol,
      protocolLabel: protocolLabel,
      pid: pid,
      serialNumber: serialNumber,
      vid: vid,
    );
  }
}
