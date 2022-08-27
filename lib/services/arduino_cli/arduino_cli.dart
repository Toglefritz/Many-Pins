import 'dart:io';
import 'package:flutter/material.dart';

import 'models/arduino_cli_version.dart';

/// This service provides methods that interact with the Arduino CLI, which is used to interact with
/// Arduino boards connected to the host platform.
///
/// The Arduino CLI is a command line tool used to build applications that interact with the Arduino ecosystem. The
/// tool provides methods to update board definitions, scan for attached Arduino boards, upload code, and other
/// functions. Interacting with the Arduino CLI is one of two major pillars for the functionality of the Many Pins
/// app, the other is serial communication with the target microcontroller.
class ArduinoCLI {
  /// Check the Arduino CLI version
  static Future<ArduinoCLIVersion?> checkArduinoCliVersion() async {
    // Try to get the Arduino CLI version
    try {
      ProcessResult result = await Process.run('arduino-cli version', ['--format json']);

      debugPrint('Retrieved Arduino CLI version: ${result.stdout}');

      return null; // TODO parse command response and return version info
    }
    // The call to get the version failed
    catch (e) {
      debugPrint('Failed to check the Arduino CLI version with error, $e');

      // A [ProcessException] typically indicates that the Arduino CLI is not installed
      if (e is ProcessException) {
        debugPrint('The Arduino CLI is not installed');
      }

      return null;
    }
  }

  /// Update the local cache platforms and libraries available to the Arduino CLI
  static Future<void> updateIndex() async {
    var result = await Process.run('arduino-cli core update-index', ['-format json']);

    debugPrint(result.toString());
  }
}
