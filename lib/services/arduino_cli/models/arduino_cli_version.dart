/// Represents version information for the Arduino CLI returned by the "arduino-cli version" command
class ArduinoCLIVersion {
  final String? application;
  final String? versionString;
  final String? commit;
  final String? status;
  final DateTime? date;

  ArduinoCLIVersion({this.application, this.versionString, this.commit, this.status, this.date});

  factory ArduinoCLIVersion.fromJson(Map<String, dynamic> json) {
    return ArduinoCLIVersion(
      application: json['Application'],
      versionString: json['VersionString'],
      commit: json['Commit'],
      status: json['Status'],
      date: DateTime.parse(json['Date']),
    );
  }
}
