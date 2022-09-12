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
  // The path to the Many Pins companion sketch
  static const String sketchPath = '../../sketches/companion_sketch';

  /// Starts a process with the Arduino CLI with the provided command and provides the response in JSON format
  /// or rethrows exceptions
  static Future<dynamic> runCliProcess(String command) async {
    try {
      Directory workingDirectory = Directory.current;

      ProcessResult result = await Process.run(
        '$command --format json',
        [],
        runInShell: true,
        workingDirectory: workingDirectory.absolute.path,
        environment: {
          'path': '${workingDirectory.absolute.path}/lib/services/arduino_cli/arduino-cli_0.27.1_Windows_64bit'
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

  /// Installs a board definition core for the Arduino CLI
  static Future<bool> installCore(String fqbn) async {
    try {
      await runCliProcess('arduino-cli core install $fqbn');

      debugPrint('Successfully installed the $fqbn core definition');

      return true;
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to install the core definition with error, $e');

      return false;
    }
  }

  /// Installs a board definition core for the Arduino CLI
  static Future<void> compileSketch(SerialDevice targetDevice) async {
    try {
      await runCliProcess('arduino-cli compile --fqbn ${targetDevice.matchingBoards?[0].fqbn} $sketchPath');

      debugPrint('Successfully compiled the sketch');
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to compile the sketch with error, $e');
    }
  }

  /// Uploads the Many Pins companion Arduino sketch to the target MCU
  static Future<void> uploadFirmware(SerialDevice targetDevice) async {
    try {
      await runCliProcess('arduino-cli board list');

      debugPrint('Successfully installed the sketch');
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to install the sketch with error, $e');
    }
  }
}
