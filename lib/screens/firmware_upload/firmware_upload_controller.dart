import 'package:flutter/material.dart';
import 'firmware_upload_route.dart';
import 'firmware_upload_view.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

/// Controller for [FirmwareUploadRoute].
class FirmwareUploadController extends State<FirmwareUploadRoute> {
  @override
  Widget build(BuildContext context) => FirmwareUploadView(this);
}
