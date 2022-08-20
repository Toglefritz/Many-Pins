import 'package:flutter/material.dart';

/// A [ListTile] with custom styling.
class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  const CardListTile({
    Key? key,
    required this.name,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$name:'),
      title: Text(value ?? 'N/A'),
    );
  }
}
