import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
import 'models/arduino_cli_version.dart';

/// This service provides methods that interact with the Arduino CLI, which is used to interact with
/// Arduino boards connected to the host platform.
///
/// The Arduino CLI is a command line tool used to build applications that interact with the Arduino ecosystem. The
/// tool provides methods to update board definitions, scan for attached Arduino boards, upload code, and other
/// functions. Interacting with the Arduino CLI is one of two major pillars for the functionality of the Many Pins
/// app, the other is serial communication with the target microcontroller.
class ArduinoCLI {
  /// Starts a process with the Arduino CLI with the provided command and provides the response in JSON format
  /// or rethrows exceptions.
  static Future<dynamic> runCliProcess(String command) async {
    try {
      Directory workingDirectory = Directory.current;

      ProcessResult result = await Process.run(
        '$command --format json',
        [],
        runInShell: true,
        workingDirectory: workingDirectory.absolute.path,
        environment: {
          'path': '${workingDirectory.absolute.path}/lib/services/arduino_cli/arduino-cli_0.26.0_Windows_64bit'
        },
      );

      dynamic responseJson = jsonDecode(result.stdout);

      return responseJson;
    } catch (e) {
      rethrow;
    }
  }

  /// Check the Arduino CLI version
  static Future<ArduinoCLIVersion?> checkArduinoCliVersion() async {
    // Try to get the Arduino CLI version
    try {
      Map<String, dynamic> responseJson = await runCliProcess('arduino-cli version') as Map<String, dynamic>;

      debugPrint('Retrieved Arduino CLI version: $responseJson');

      return ArduinoCLIVersion.fromJson(responseJson);
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to check the Arduino CLI version with error, $e');

      return null;
    }
  }

  /// Updates the local cache of available platforms and libraries
  static Future<void> updateCliIndex() async {
    // Try to get the Arduino CLI version
    try {
      Directory workingDirectory = Directory.current;

      await Process.run(
        'arduino-cli core update-index',
        [],
        runInShell: true,
        workingDirectory: workingDirectory.absolute.path,
        environment: {
          'path': '${workingDirectory.absolute.path}/lib/services/arduino_cli/arduino-cli_0.26.0_Windows_64bit'
        },
      );

      debugPrint('Updated Arduino CLI index');
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to update the Arduino CLI index with error, $e');
    }
  }

  /// Get a list of serial ports available on the host machine on which an Arduino-compatible board is detected
  static Future<List<SerialDevice>?> getSerialPorts() async {
    // Try to get the Arduino CLI version
    try {
      List<dynamic> responseJson = await runCliProcess('arduino-cli board list') as List<dynamic>;

      debugPrint('Retrieved serial ports list: $responseJson');

      List<SerialDevice> ports = [];
      for (Map<String, dynamic> port in responseJson) {
        SerialDevice device = SerialDevice.fromJson(port);

        // Check if there is an Arduino board on the port
        if (device.matchingBoards != null && device.matchingBoards?.isNotEmpty == true) {
          ports.add(SerialDevice.fromJson(port));
        }
      }

      return ports;
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to retrieve serial ports list, $e');

      return null;
    }
  }
}
