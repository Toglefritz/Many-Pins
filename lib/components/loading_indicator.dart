import 'package:flutter/material.dart';

/// Displays a spinner while an asynchronous operation is in progress
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
      strokeWidth: 3,
    );
  }
}
