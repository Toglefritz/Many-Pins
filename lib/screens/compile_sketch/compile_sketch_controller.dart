import 'package:flutter/material.dart';
import 'package:many_pins/services/arduino_cli/arduino_cli.dart';
import 'compile_sketch_route.dart';
import 'compile_sketch_view.dart';

/// Controller for [CompileSketchRoute].
class CompileSketchController extends State<CompileSketchRoute> {
  @override
  void initState() {
    compileSketch();

    super.initState();
  }

  /// Compiles the companion sketch for the target board
  Future<void> compileSketch() async {
    bool compilationSuccessful = false;
    if (widget.device.matchingBoards?[0].fqbn?.full != null) {
      bool compilationSuccessful = await ArduinoCLI.compileSketch(widget.device.matchingBoards![0].fqbn!.full!);

      if (compilationSuccessful) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // TODO Navigator.pushNamed(context, CompileSketch.routeName,);
        });
      }
    }

    if (!compilationSuccessful) {
      // TODO display an error page
    }
  }

  @override
  Widget build(BuildContext context) => CompileSketchView(this);
}
