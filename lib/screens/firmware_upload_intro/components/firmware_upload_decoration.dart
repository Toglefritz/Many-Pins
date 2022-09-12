import 'package:flutter/material.dart';

/// A decorative element for the firmware upload step.
class FirmwareUploadDecoration extends StatelessWidget {
  const FirmwareUploadDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            width: 170,
            height: 170,
            child: Icon(
              Icons.code,
              size: 65,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Icon(
            Icons.arrow_forward,
            size: 50,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            width: 170,
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset(
                'assets/arduino_icon.png',
                color: Theme.of(context).primaryColor,
                width: 120,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
