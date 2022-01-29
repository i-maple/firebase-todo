import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.deepPurple,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(20),
        child: RawMaterialButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
