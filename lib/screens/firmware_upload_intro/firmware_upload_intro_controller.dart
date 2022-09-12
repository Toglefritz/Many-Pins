import 'package:flutter/material.dart';
import '../install_core/install_core_route.dart';
import 'firmware_upload_intro_route.dart';
import 'firmware_upload_intro_view.dart';

/// Controller for [FirmwareUploadIntroRoute].
class FirmwareUploadIntroController extends State<FirmwareUploadIntroRoute> {
  bool firmwareUploading = false;

  /// Start the firmware upload process via an Arduino CLI command
  void beginFirmwareUpload() {
    Navigator.pushReplacementNamed(
      context,
      InstallCoreRoute.routeName,
      arguments: widget.device,
    );
  }

  @override
  Widget build(BuildContext context) => FirmwareUploadIntroView(this);
}
