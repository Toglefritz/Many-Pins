import 'package:flutter/material.dart';
import 'package:many_pins/components/clear_button.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'components/firmware_upload_decoration.dart';
import 'firmware_upload_intro_controller.dart';

/// View for [FirmwareUploadRoute].
class FirmwareUploadIntroView extends StatelessWidget {
  final FirmwareUploadIntroController state;

  const FirmwareUploadIntroView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.firmwareUploadPageTitle),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FirmwareUploadDecoration(),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.info_outline,
                    size: 40,
                  ),
                ),
                Text(
                  Strings.firmwareUploadWarning,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ClearButton(
              onPressed: () => state.beginFirmwareUpload(),
              text: Strings.upload.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
