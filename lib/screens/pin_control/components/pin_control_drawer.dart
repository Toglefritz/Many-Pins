import 'package:flutter/material.dart';
import '../../../components/clear_button.dart';
import '../../../values/strings.dart';
import '../pin_control_controller.dart';
import 'command_parameter_chip.dart';

/// A [Drawer] containing a [Form] used to select the parameters used for a control command sent via serial
/// to a microcontroller board
class PinControlDrawer extends StatelessWidget {
  const PinControlDrawer({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PinControlController state;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'GPIO Pin ${state.targetPin?.label.trim()}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommandParameterChip(
                          state: state,
                          name: Strings.read,
                          onSelected: (bool selected) => state.operationSelected(Strings.read),
                          selected: state.operation,
                        ),
                        CommandParameterChip(
                          state: state,
                          name: Strings.write,
                          onSelected: (bool selected) => state.operationSelected(Strings.write),
                          selected: state.operation,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommandParameterChip(
                          state: state,
                          name: Strings.digital,
                          onSelected: (bool selected) => state.inputModeSelected(Strings.digital),
                          selected: state.inputMode,
                        ),
                        CommandParameterChip(
                          state: state,
                          name: Strings.analog,
                          onSelected: (bool selected) => state.inputModeSelected(Strings.analog),
                          selected: state.inputMode,
                        ),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: state.operation == Strings.write
                        ? Padding(
                            padding: const EdgeInsets.all(20),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: state.inputMode == Strings.digital
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          CommandParameterChip(
                                            state: state,
                                            name: Strings.high,
                                            onSelected: (bool selected) =>
                                                state.digitalWriteValueSelected(Strings.high),
                                            selected: state.digitalWriteValue,
                                          ),
                                          CommandParameterChip(
                                            state: state,
                                            name: Strings.low,
                                            onSelected: (bool selected) => state.digitalWriteValueSelected(Strings.low),
                                            selected: state.digitalWriteValue,
                                          ),
                                        ],
                                      ),
                                    )
                                  : TextField(
                                      controller: state.writeValueController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: '${state.inputMode} ${Strings.writeValue}',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        isDense: true,
                                      ),
                                      onChanged: (String input) => state.handleWriteValueChanged(input),
                                      cursorColor: Theme.of(context).primaryColor,
                                    ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              height: 88,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClearButton(
                onPressed: state.closeDrawers,
                text: Strings.sendCommand.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
