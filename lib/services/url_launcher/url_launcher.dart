import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

/// Contains URLs launched by different parts of the app and methods to launch them
class UrlLauncher {
  static Uri arduinoCliDownload =
      Uri.parse('https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Windows_64bit.zip');

  /// Launches a URL
  static Future<void> launch(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  /// Gets the path of the Downloads system folder
  static Future<Uri> getDownloadsPath() async {
    Directory? downloadsDirectory = await getDownloadsDirectory();
    String downloadsPath = downloadsDirectory?.path ?? 'file://C:';

    return Uri.parse(downloadsPath.replaceAll('\\', '/'));
  }

  /// Opens the system Downloads folder
  static Future<void> openDownloads() async {
    Uri downloadsUri = await getDownloadsPath();

    launch(downloadsUri);
  }
}
