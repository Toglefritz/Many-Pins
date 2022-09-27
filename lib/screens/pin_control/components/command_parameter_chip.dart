import 'package:flutter/material.dart';
import '../pin_control_controller.dart';

/// A choice in the selection of parameters for GPIO control commands.
class CommandParameterChip extends StatelessWidget {
  const CommandParameterChip({
    Key? key,
    required this.state,
    required this.name,
    required this.onSelected,
    required this.selected,
  }) : super(key: key);

  final PinControlController state;
  final String name;
  final Function(bool) onSelected;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: SizedBox(
        width: 75,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: selected == name ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
              ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      selected: selected == name,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: onSelected,
    );
  }
}
