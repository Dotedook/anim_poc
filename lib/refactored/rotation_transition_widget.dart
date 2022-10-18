import 'package:flutter/material.dart';

class BouncingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  const BouncingTransition(
      {super.key, required this.child, required this.angle});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      builder: ((context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      }),
      child: child,
    );
  }
}
