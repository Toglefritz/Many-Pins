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
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SerialPortList(state: state),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.initPorts,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
