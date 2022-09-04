import 'package:flutter/material.dart';
import 'update_index_controller.dart';

/// Updates the Arduino CLI index of available platforms and libraries.
class UpdateIndexRoute extends StatefulWidget {
  static const String routeName = '/update_index';

  const UpdateIndexRoute({Key? key}) : super(key: key);

  @override
  UpdateIndexController createState() => UpdateIndexController();
}
