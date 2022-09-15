import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/loading_indicator.dart';
import '../../values/strings.dart';
import 'upload_firmware_controller.dart';

/// View for [UploadFirmwareRoute].
class UploadFirmwareView extends StatelessWidget {
  final UploadFirmwareController state;

  const UploadFirmwareView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.uploadFirmware),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LoadingIndicator(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(Strings.uploadingFirmware),
            ),
          ],
        ),
      ),
    );
  }
}
