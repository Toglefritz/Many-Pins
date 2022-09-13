import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/models/serial_device.dart';
import 'compile_sketch_controller.dart';

/// Compiles the sketch in preparation to upload it to the target board.
class CompileSketchRoute extends StatefulWidget {
  static const String routeName = '/compile_sketch';

  const CompileSketchRoute({Key? key, required this.device}) : super(key: key);

  final SerialDevice device;

  @override
  CompileSketchController createState() => CompileSketchController();
}
