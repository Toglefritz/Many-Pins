import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'firmware_upload_controller.dart';

/// View for [FirmwareUploadRoute].
class FirmwareUploadView extends StatelessWidget {
  final FirmwareUploadController state;

  const FirmwareUploadView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.firmwareUploadPageTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: SizedBox.shrink(),
    );
  }
}
