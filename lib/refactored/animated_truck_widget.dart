import 'package:flutter/material.dart';

class AnimatedTruck extends StatelessWidget {
  const AnimatedTruck({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Icon(
        Icons.fire_truck,
        color: Colors.pink,
        size: 100,
      ),
    );
  }
}
