import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../components/loading_indicator.dart';
import '../../values/strings.dart';
import 'compile_sketch_controller.dart';

/// View for [CompileSketchRoute].
class CompileSketchView extends StatelessWidget {
  final CompileSketchController state;

  const CompileSketchView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.compileSketch),
        actions: const [
          BrightnessToggle(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: LoadingIndicator(),
                ),
                Text(
                  Strings.compilingSketch,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
