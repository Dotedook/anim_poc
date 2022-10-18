import 'package:anim_poc/refactored/animated_truck_widget.dart';
import 'package:flutter/material.dart';

class FlutterAnimationPage extends StatefulWidget {
  static String routeName = '/flutter-animation';
  const FlutterAnimationPage({super.key});

  @override
  State<FlutterAnimationPage> createState() => _FlutterAnimationPageState();
}

class _FlutterAnimationPageState extends State<FlutterAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação Nativa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Agora a ideia é sucumbir ao fácil e usar o que o flutter da de graça',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          RotationTransition(
            turns: animation,
            child: const AnimatedTruck(),
          ),
          const SizedBox(
            height: 50,
          ),
          FadeTransition(
            opacity: animation,
            child: const AnimatedTruck(),
          ),
          const SizedBox(
            height: 50,
          ),
          SizeTransition(
            sizeFactor: animation,
            child: const AnimatedTruck(),
          )
        ],
      ),
    );
  }
}
