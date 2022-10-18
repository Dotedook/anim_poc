import 'package:anim_poc/refactored/animated_truck_widget.dart';
import 'package:anim_poc/refactored/rotation_transition_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RefactoredAnimationPage extends StatefulWidget {
  static String routeName = '/refactored';
  const RefactoredAnimationPage({super.key});

  @override
  State<RefactoredAnimationPage> createState() =>
      _RefactoredAnimationPageState();
}

class _RefactoredAnimationPageState extends State<RefactoredAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    //Usando isso aqui a gente vai cascateando os animation<double> criando cada vez algo mais maluco
    final curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);

    animation = Tween<double>(begin: 0, end: 2 * math.pi)
        .animate(curvedAnimation)
      //Da para remover o listener e o useState agora porque o AnimatedWidget implicitamente
      //já vai fazer isso
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
        title: const Text('Animação Refatorada'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'A ideia agora é refatorar o que foi feito e separar as responsabilidades',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Conseguimos separar toda a movimentação em duas partes.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '1º - Separar o Widget que vai ser animado',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '2º - Separar o movimento do widget para reaproveitar',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          BouncingTransition(
            angle: animation,
            child: const AnimatedTruck(),
          )
        ],
      ),
    );
  }
}
