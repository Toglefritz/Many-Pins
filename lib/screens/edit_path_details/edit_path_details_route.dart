import 'package:flutter/material.dart';
import 'edit_path_details_controller.dart';

/// Performs initialization for the app.
///
/// This route loads when the app is launched. It performs several configuration and setup tasks necessary for the
/// remainder of the app to run correctly. This main centers around checking on the installation of the Arduino CLI
/// tool and displaying either information about the tool or a prompt to install it if it is missing from the system.
class EditPathDetailsRoute extends StatefulWidget {
  const EditPathDetailsRoute({Key? key}) : super(key: key);

  @override
  EditPathDetailsController createState() => EditPathDetailsController();
}
