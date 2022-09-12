import 'package:flutter/material.dart';
import '../../components/brightness_toggle.dart';
import '../../values/strings.dart';
import 'install_core_controller.dart';

/// View for [InstallCoreRoute].
class InstallCoreView extends StatelessWidget {
  final InstallCoreController state;

  const InstallCoreView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.installingCoreTitle),
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 4,
                  ),
                ),
                Text(
                  '${Strings.installingCore}: ${state.widget.device.matchingBoards?[0].fqbn?.name}:${state.widget.device.matchingBoards?[0].fqbn?.architecture}...',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
