import 'package:flutter/material.dart';
import '../models/side.dart';

/// A button representing an individual GPIO pin on a microcontroller board
class PinButton extends StatelessWidget {
  const PinButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.side,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final Side side;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 70,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: side == Side.left ? const Radius.circular(16) : Radius.zero,
              bottomRight: side == Side.left ? const Radius.circular(16) : Radius.zero,
              topLeft: side == Side.right ? const Radius.circular(16) : Radius.zero,
              bottomLeft: side == Side.right ? const Radius.circular(16) : Radius.zero,
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: side == Side.left ? const EdgeInsets.only(right: 8) : const EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
