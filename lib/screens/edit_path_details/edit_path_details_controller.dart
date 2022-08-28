import 'package:flutter/material.dart';
import 'edit_path_details_route.dart';
import 'edit_path_details_view.dart';

/// Controller for [EditPathDetailsRoute].
class EditPathDetailsController extends State<EditPathDetailsRoute> {
  /// Navigates back to the [AppLoadingRoute] to verify installation of the Arduino CLI
  void verifyCliInstallation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) => EditPathDetailsView(this);
}
