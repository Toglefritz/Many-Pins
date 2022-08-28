import 'package:flutter/material.dart';

/// A circle icon used to indicate the current step of the linear process
class StepIndicator extends StatelessWidget {
  const StepIndicator({
    Key? key,
    required this.filled,
  }) : super(key: key);

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: filled ? const Icon(Icons.circle) : const Icon(Icons.circle_outlined),
    );
  }
}
