import 'package:flutter/material.dart';

import '../theme.dart';

class CounterButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  const CounterButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      height: MediaQuery.of(context).size.width / 7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: secondColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999))),
        onPressed: onPressed,
        child: FittedBox(
          child: icon,
        ),
      ),
    );
  }
}
