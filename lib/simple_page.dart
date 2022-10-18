import 'package:flutter/material.dart';
import 'dart:math' as math;

class SimpleAnimationPage extends StatefulWidget {
  static String routeName = '/simple-animation';
  const SimpleAnimationPage({super.key});

  @override
  State<SimpleAnimationPage> createState() => _SimpleAnimationPageState();
}

class _SimpleAnimationPageState extends State<SimpleAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    //Esse tween vai mudar o valor do animation controller de 0 -> 1  para 0 -> 2 * math.pi
    animation = Tween<double>(begin: 0, end: 2 * math.pi)
        .animate(animationController)
      //Cascade anotation https://www.educative.io/answers/what-is-dart-cascade-notation
      //Toda animação expoe um listner, então aqui a gente pode ficar de olho nesse listener e
      //atualizar a UI toda vez que o valor for atualizado
      ..addListener(() {
        setState(() {});
      })
      //Aqui ficamos de olho no status da animação, quando ela chega no valor 1 (completed) mandamos ela voltar
      //e quando ela chega no valor 0 mandamos ela ir pra frente.
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
        title: const Text('Animação Simples'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Animação no flutter não "anima", somente cria valores que podem ser usados na UI',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Toda animação no flutter deve ter uma controller. Essa controller deve ter um valor para o VSYNC, isso faz com que o flutter saiba qual é a taxa de atualização da tela do telefone e quantas vezes ele deve enviar uma nova atualização de valores para a UI.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Transform.rotate(
            angle: animation.value,
            child: Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.fire_truck,
                  color: Colors.pink,
                  size: 100,
                )),
          ),
        ],
      ),
    );
  }
}
